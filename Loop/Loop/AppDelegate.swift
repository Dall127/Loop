//
//  AppDelegate.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/16/20.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //print("Your code here")
		print("here")
        FirebaseApp.configure()
        return true
    }
}
