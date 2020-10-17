//
//  LoopApp.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI
import Firebase
import Combine
import Foundation


class SessionStore : ObservableObject {
	var didChange = PassthroughSubject<SessionStore, Never>()
	var session: User? { didSet { self.didChange.send(self) }}
	var handle: AuthStateDidChangeListenerHandle?
	
	func listen () {
		// monitor authentication changes using firebase
		handle = Auth.auth().addStateDidChangeListener { (auth, user) in
			if let user = user {
				// if we have a user, create a new user model
				print("Got user: \(user)")
				self.session = User(
					uid: user.uid,
					displayName: user.displayName, email: user.email
				)
			} else {
				// if we don't have a user, set our session to nil
				self.session = nil
			}
		}
	}
	
	
	func signUp(
		email: String,
		password: String,
		handler: @escaping AuthDataResultCallback
	) {
		Auth.auth().createUser(withEmail: email, password: password, completion: handler)
	}
	
	func signIn(
		email: String,
		password: String,
		handler: @escaping AuthDataResultCallback
	) {
		Auth.auth().signIn(withEmail: email, password: password, completion: handler)
	}
	
	func signOut () -> Bool {
		do {
			try Auth.auth().signOut()
			self.session = nil
			return true
		} catch {
			return false
		}
	}
	
	func unbind () {
		if let handle = handle {
			Auth.auth().removeStateDidChangeListener(handle)
		}
	}
	
	
	
	
	// additional methods (sign up, sign in) will go here
}
class User {
	var uid: String
	var email: String?
	var displayName: String?
	
	init(uid: String, displayName: String?, email: String?) {
		self.uid = uid
		self.email = email
		self.displayName = displayName
	}
	
}






@main
struct LoopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("setting up firebase")
        FirebaseApp.configure()
        print("finished setting up firebase")
        return true
    }
}

struct LoopApp_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
