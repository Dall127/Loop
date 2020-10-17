//
//  LoopApp.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI
import Firebase

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
