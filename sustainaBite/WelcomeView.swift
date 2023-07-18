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
                Color("almond")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Welcome to ")
                        .font(Font.custom("Poppins-SemiBoldItalic", size: 40))
                        .foregroundColor(Color("darkGreen"))

                    VStack(spacing: 20.0) {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .background(Rectangle()
                        .foregroundColor(.white))
                    .cornerRadius(15)
                    .shadow(radius: 15)
                    .padding(.horizontal, 30.0)
                    
                    Spacer().frame(height:50)
                    
                    HStack {
                        NavigationLink(destination: FoodView()) {
                            Text("Recipes & Food")
                                .font(Font.custom("Poppins-Medium", size: 22))
                                .foregroundColor(Color("darkGreen"))
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.white))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.horizontal, 10.0)
                        
                        NavigationLink(destination: FoodView()) {
                            Text("Local Farmer Markets")
                                .font(Font.custom("Poppins-Medium", size: 22))
                                .foregroundColor(Color("darkGreen"))
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.white))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.horizontal, 10.0)
                    }
                    
                    NavigationLink(destination: FoodView()) {
                        Text("About SustainaBite 🍃")
                            .font(Font.custom("Poppins-Medium", size: 28))
                            .foregroundColor(Color("darkGreen"))
                    }
                    .padding()
                    .background(Rectangle()
                        .foregroundColor(.white))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.vertical, 15.0)
                    
                }
//                    .toolbar {
//                        ToolbarItem(placement: .status) {
//                            Button("Press Me") {
//                                print("pressed")
//                            }
//                        }
//                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
