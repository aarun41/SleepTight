//
//  HomeScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/21/22.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        VStack {
            Text("Login").font(.largeTitle)
                .padding(.bottom, 20)
            Image("PurpleProfilePic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
