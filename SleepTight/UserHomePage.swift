//
//  UserHomePage.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase

struct UserHomePage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
            
            Button(action: {
                viewRouter.currentPage = .userLoginScreen
            }) {
                BackButtonContent()
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

struct UserHomePage_Previews: PreviewProvider {
    static var previews: some View {
        UserHomePage().environmentObject(ViewRouter())
    }
}
