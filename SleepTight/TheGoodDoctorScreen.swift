//
//  TheGoodDoctorScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/23/22.
//

import SwiftUI
import Firebase

struct TheGoodDoctorScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    
    
    //@State var day = ""

    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {
                    viewRouter.currentPage = .userHomePage
                }) {
                    Text("Back to My Plan")
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Sunday"))
                    Text(
                    "\t - Alarm: 9:00 am\n\t - Bedtime: 1:00 am"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Monday"))
                    Text(
                    "\t - Alarm: 8:45 am\n\t - Bedtime: 12:00 am"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Tuesday"))
                    Text(
                    "\t - Alarm: 8:45 am\n\t - Bedtime: 11:45 pm"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Wednesday"))
                    Text(
                    "\t - Alarm: 8:30 am\n\t - Bedtime: 11:45 pm"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Thursday"))
                    Text(
                    "\t - Alarm: 8:30 am\n\t - Bedtime: 11:00 pm"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Friday"))
                    Text(
                    "\t - Alarm: 8:00 am\n\t - Bedtime: 11:00 pm"
                    )
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Saturday"))
                    Text(
                    "\t - Alarm: 7:30 am\n\t - Bedtime: 11:00 pm"
                    )
                }
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if signOutProcessing {
                                ProgressView()
                        } else {
                            Button("Sign Out") {
                                signOutUser()
                            }
                        }
                    }
                }
            }
        }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            viewRouter.currentPage = .userLoginScreen
        }
    }
}


struct TheGoodDoctorScreen_Previews: PreviewProvider {
    static var previews: some View {
        TheGoodDoctorScreen().environmentObject(ViewRouter())
    }
}
