//
//  MotherView.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

let storedUsername = "gburdell"
let storedPassword = "hackgt"
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        if UserDefaults.standard.launchScreenShown == false {
            LaunchScreen()
        }
        else {
            switch viewRouter.currentPage {
            case .loginScreen:
                LoginScreen()
            case .userRegistrationScreen:
                UserRegistrationScreen()
            case .doctorRegistrationScreen:
                DoctorRegistrationScreen()
            case .userHomePage:
                UserHomePage()
            case .doctorPatientList:
                DoctorPatientList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
