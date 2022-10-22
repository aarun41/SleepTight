//
//  ContentView.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView: View {
    var body: some View {
        if UserDefaults.standard.launchScreenShown {
            LoginScreen()
        }
        else {
            LaunchScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
