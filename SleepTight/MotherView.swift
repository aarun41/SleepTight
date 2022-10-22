//
//  MotherView.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        if UserDefaults.standard.launchScreenShown == false {
            LaunchScreen()
        }
        else {
            switch viewRouter.currentPage {
            case .userLoginScreen:
                UserLoginScreen()
            case .doctorLoginScreen:
                DoctorLoginScreen()
            case .userRegistrationScreen:
                UserRegistrationScreen()
            case .doctorRegistrationScreen:
                DoctorRegistrationScreen()
            case .userHomePage:
                UserHomePage()
            case .doctorPatientList:
                DoctorPatientList()
            case .chooseTypeScreen:
                ChooseTypeScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
