//
//  SleepTightApp.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SleepTightApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)        }
    }
}
