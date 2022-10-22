//
//  UserRegistrationScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase

struct UserRegistrationScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmation: String = ""
    
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            UserRegistrationTitle()
            UserEmailField(email: $email)
            UserEnterPasswordField(password: $password)
            UserConfirmPasswordField(confirmation: $confirmation)
            
            Button(action: {
                signUpUser(userEmail: email, userPassword: password)
            }) {
                RegisterButtonContent()
            }
            
            Button(action: {
                viewRouter.currentPage = .userLoginScreen
            }) {
                SwitchToLoginButtonContent()
            }
            
            if signUpProcessing {
                ProgressView()
            }
            
            if !signUpErrorMessage.isEmpty {
                Text("Failed creating account: \(signUpErrorMessage)")
                    .foregroundColor(.red)
            }
            
            Spacer()
            
        }.padding()
        .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !confirmation.isEmpty && password == confirmation ? false : true)

    }
    
    func signUpUser(userEmail: String, userPassword: String) {
        
        signUpProcessing = true
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
            guard error == nil else {
                signUpErrorMessage = error!.localizedDescription
                signUpProcessing = false
                return
            }
            
            switch authResult {
            case .none:
                print("Could not create account.")
                signUpProcessing = false
            case .some(_):
                print("User created")
                signUpProcessing = false
                viewRouter.currentPage = .userHomePage
            }
        }
    }
}

struct UserRegistrationTitle: View {
    var body: some View {
        Text("Register").font(.largeTitle)
            .padding(.bottom, 20)
    }
}

struct UserEmailField: View {
    @Binding var email: String
    var body: some View {
        TextField("gburdell@gatech.edu", text: $email)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct UserEnterPasswordField: View {
    @Binding var password: String
    var body: some View {
        TextField("Enter password here", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct UserConfirmPasswordField: View {
    @Binding var confirmation: String
    var body: some View {
        TextField("Confirm password here", text: $confirmation)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct UserRegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationScreen().environmentObject(ViewRouter())
    }
}

