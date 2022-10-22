//
//  OpeningPage.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

extension UserDefaults {
    
    var launchScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "launchScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "launchScreenShown")
        }
    }
}

    struct LaunchScreen: View {
        var body: some View {
            VStack(spacing: 20){
                Text("Welcome").font(.largeTitle)
                Text("We'll eventually have a tour of our features here for you!").font(.title2)
            }.onAppear(perform: {
                UserDefaults.standard.launchScreenShown = true
            })
        }
    }
    
    struct OpeningPage_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreen()
        }
    }
