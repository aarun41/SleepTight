//
//  DoctorLoginScreen.swift
//  SleepTight
//
//  Reference: https://blckbirds.com/ tutorials
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct DoctorLoginScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            DoctorLoginHeading()
            ProfilePic()
            DoctorLoginEmailField(email: $email)
            DoctorPasswordField(password: $password)
            
            Button(action: {
                viewRouter.currentPage = .doctorRegistrationScreen
            }) {
                SwitchToRegistrationButtonContent()
            }
            
            Button(action: {
                signInDoctor(userEmail: email, userPassword: password)
            }) {
                LoginButtonContent()
            }
            .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
            
            Button(action: {
                viewRouter.currentPage = .chooseTypeScreen
            }) {
                BackButtonContent()
            }
            
        }.padding()
        
        if signInProcessing {
            ProgressView()
        }

        if !signInErrorMessage.isEmpty {
            Text("Failed creating account: \(signInErrorMessage)")
                .foregroundColor(.red)
        }
        
    }
    
    func signInDoctor(userEmail: String, userPassword: String) {
        
        signInProcessing = true
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }
            switch authResult {
            case .none:
                print("Could not sign in user.")
                signInProcessing = false
            case .some(_):
                print("User signed in")
                signInProcessing = false
                withAnimation {
                    viewRouter.currentPage = .doctorPatientList
                }
            }
            
        }
    }
}

struct DoctorLoginHeading: View {
    var body: some View {
        Text("Login").font(.largeTitle)
            .padding(.bottom, 20)
    }
}

struct DoctorLoginEmailField: View {
    @Binding var email: String
    var body: some View {
        TextField("Ex: gburdell@gatech.edu", text: $email)
            .autocapitalization(.none)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct DoctorPasswordField: View {
    @Binding var password: String
    var body: some View {
        TextField("Enter password here", text: $password)
            .autocapitalization(.none)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct DoctorLoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginScreen().environmentObject(ViewRouter())
    }
}
