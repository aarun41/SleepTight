//
//  DoctorPatientList.swift
//  SleepTight
//
//  Reference: https://blckbirds.com/ tutorials
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase

struct DoctorPatientList: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if signOutProcessing {
                        ProgressView()
                    } else {
                        Button("Sign Out") {
                            signOutDoctor()
                    }
                }
            }
        }
    }
    
    func signOutDoctor() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            viewRouter.currentPage = .doctorLoginScreen
        }
    }
}

struct DoctorPatientList_Previews: PreviewProvider {
    static var previews: some View {
        DoctorPatientList().environmentObject(ViewRouter())
    }
}
