//
//  GBurdellScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase

struct GBurdellScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    @State var sleepSchedule = ""

    var body: some View {
        NavigationView {
            VStack {
                DayCell(sleepSchedule: $sleepSchedule)
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
    var body: some View {
        VStack {
            Text("Day")
            ScrollView {
                TextField("Today's sleep schedule is", text: $sleepSchedule)
            }
        }
    }
}

struct GBurdellScreen_Previews: PreviewProvider {
    static var previews: some View {
        GBurdellScreen().environmentObject(ViewRouter())
    }
}
