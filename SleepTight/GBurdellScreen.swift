//
//  GBurdellScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct GBurdellScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    
    @State var sleepSchedule1 = ""
    @State var sleepSchedule2 = ""
    @State var sleepSchedule3 = ""
    @State var sleepSchedule4 = ""
    @State var sleepSchedule5 = ""
    @State var sleepSchedule6 = ""
    @State var sleepSchedule7 = ""
    
    //@State var day = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Sunday"))
                    DayContents(sleepSchedule: $sleepSchedule1)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Monday"))
                    DayContents(sleepSchedule: $sleepSchedule2)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Tuesday"))
                    DayContents(sleepSchedule: $sleepSchedule3)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Wednesday"))
                    DayContents(sleepSchedule: $sleepSchedule4)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Thursday"))
                    DayContents(sleepSchedule: $sleepSchedule5)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Friday"))
                    DayContents(sleepSchedule: $sleepSchedule6)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(lightGreyColor)
                        .frame(height: 35)
                        .overlay(Text("Saturday"))
                    DayContents(sleepSchedule: $sleepSchedule7)
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

struct DayCell: View {
    @Binding var sleepSchedule: String
    @Binding var day: String
    var body: some View {
        VStack {
            TextField("Day", text: $day)
                .background(lightGreyColor)
            DayContents(sleepSchedule: $sleepSchedule)
        }
    }
}

struct DayContents: View {
    @Binding var sleepSchedule: String
    //var height = UIScreen.main.bounds.height/7.0
    var body: some View {
        ScrollView {
            TextField("Today's sleep schedule is", text: $sleepSchedule)
                .frame(width: UIScreen.main.bounds.width, height: 50)
        }
        .fixedSize(horizontal: true, vertical: false)
        .frame(width: UIScreen.main.bounds.width, height: 300)
    }
}

struct GBurdellScreen_Previews: PreviewProvider {
    static var previews: some View {
        GBurdellScreen().environmentObject(ViewRouter())
    }
}
