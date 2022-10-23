//
//  ChooseTypeScreen.swift
//  SleepTight
//
//  Reference: https://blckbirds.com/ tutorials
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI

struct ChooseTypeScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Button(action: {
                viewRouter.currentPage = .doctorLoginScreen
            }) {
                DoctorButtonContent()
            }
            
            Button(action: {
                viewRouter.currentPage = .userLoginScreen
            }) {
                UserButtonContent()
            }
        }
    }
}

struct DoctorButtonContent: View {
    var body: some View {
        Text("I'm a DOCTOR")
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 220, height: 30)
            .background(lightGreyColor)
            .cornerRadius(5.0)
    }
}

struct UserButtonContent: View {
    var body: some View {
        Text("I'm a USER")
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 220, height: 30)
            .background(lightGreyColor)
            .cornerRadius(5.0)
    }
}

struct BackButtonContent: View {
    var body: some View {
        Text("<< Back")
            .foregroundColor(.indigo)
            .frame(width: 80, height: 15)
            .background(.white)
            .cornerRadius(3.0)
    }
}

struct SwitchToRegistrationButtonContent: View {
    var body: some View {
        Text("Don't have an account yet? Register here")
            .foregroundColor(.black)
            .frame(width: 350, height: 15)
            .background(.white)
            .cornerRadius(3.0)
    }
}

struct SwitchToLoginButtonContent: View {
    var body: some View {
        Text("Already have an account? Login here")
            .foregroundColor(.black)
            .frame(width: 350, height: 15)
            .background(.white)
            .cornerRadius(3.0)
    }
}

struct ProfilePic: View {
    var body: some View {
        Image("PurpleProfilePic")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct RegisterButtonContent: View {
    var body: some View {
        Text("REGISTER")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct ChooseTypeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTypeScreen().environmentObject(ViewRouter())
    }
}
