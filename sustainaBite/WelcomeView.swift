//
//  ContentView.swift
//  sustainaBite
//
//  Created by scholar on 7/17/23.
//

import SwiftUI

struct WelcomeView: View {
    @State private var presentAlertF = false
    @State private var presentAlertN = false
    @State private var presentAlertM = false

    var body: some View {
        NavigationStack {
            ZStack {
                Text("hello")
                Color("almond")
                    .ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading, spacing: 20.0) {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.white))
                    .cornerRadius(15)
                    .shadow(radius: 20)
                    .padding(.horizontal, 30.0)
                    
                    Spacer().frame(height:50)
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Let's Go!").font(.system(size:25)).fontWeight(.bold).foregroundColor(Color("darkGreen"))
                    }
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.white))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.horizontal, 30.0)
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
