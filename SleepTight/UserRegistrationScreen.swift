//
//  UserRegistrationScreen.swift
//  SleepTight
//
//  Reference: https://blckbirds.com/ tutorials
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct UserRegistrationScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmation: String = ""
    
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    //var ref: DatabaseReference!

    //ref = Database.database().reference()
    
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
            .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !confirmation.isEmpty && password == confirmation ? false : true)
            
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
            .autocapitalization(.none)
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
            .autocapitalization(.none)
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
            .autocapitalization(.none)
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

