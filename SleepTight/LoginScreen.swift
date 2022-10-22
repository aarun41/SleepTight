//
//  HomeScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Heading()
            ProfilePic()
            
            //Username
            TextField("gburdell", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            //Password
            SecureField("Enter password here", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            //Login button
            Button(action: {print("Button tapped")}) {
                           LoginButtonContent()
            }
        }.padding()
    }
}

struct Heading: View {
    var body: some View {
        Text("Login").font(.largeTitle)
            .padding(.bottom, 20)
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
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
