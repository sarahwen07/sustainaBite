//
//  AboutView.swift
//  sustainaBite
//
//  Created by scholar on 7/18/23.
//

import SwiftUI

struct AboutView: View {
    @State private var presentAlert1 = false
    @State private var presentAlert2 = false
    @State private var presentAlert3 = false
    @State private var presentAlert4 = false
    @State private var presentAlert5 = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Spacer()
                            .frame(height: 50.0)
                        
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
                        
                        
                        Text("Click on the emoji's to learn more!")
                            .font(Font.custom("Poppins-Medium", size: 18))
                            .foregroundColor(Color("darkGreen"))
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(.white))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal, 17)
                            .padding(.top)
                     
                        //-------------------------------------------------------------
                        HStack (spacing: 20.0) {
                            Button (
                                action : { presentAlert1 = true},
                                label : { Text("🗝️")
                                    .font(.system(size: 50))
                                    .padding()
                                    .background(Rectangle()
                                        .foregroundColor(.white))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding(.vertical)
                            })
                            .alert(isPresented: $presentAlert1,
                                   content : { Alert(
                            title: Text("Welcome to SustainaBite!"),
                            message: Text("At SustainaBite, our mission is to empower individuals with dietary restrictions by providing sustainable and organic recipes. We believe that everyone deserves to enjoy delicious meals that align with their dietary needs while having a positive impact on the environment.")
                            )})
                            
                            //------------------------------------------------------------
                            Button (
                                action : { presentAlert2 = true},
                                label : {Text("🪴")
                                    .font(.system(size: 50))
                                    .padding()
                                    .background(Rectangle()
                                    .foregroundColor(.white))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding()
                            })
                            .alert(isPresented: $presentAlert2,
                                   content : { Alert(
                            title: Text("Embracing Sustainability"),
                            message: Text("We are passionate about promoting sustainable farming practices and supporting local farmers. Sustainabite aims to raise awareness about the importance of sustainable farming the benefits of consuming organic, locally sourced ingredients. By doing so, we strive to foster a stronger connection between conscious consumers and local farmers, enhancing the well-being of both our bodies and the planet.")
                            )})
                            
                            //----------------------------------------------------
                            Button (
                                action : { presentAlert3 = true},
                                label : {Text("🥬")
                                    .font(.system(size: 50))
                                    .padding()
                                    .background(Rectangle()
                                    .foregroundColor(.white))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding(.vertical)
                            })
                            .alert(isPresented: $presentAlert3,
                                   content : { Alert(
                            title: Text("Explore Organic Delights"),
                            message: Text("In our app, you'll discover a selection of recipes, thoughtfully curated to meet your dietary requirements. Whether you are seeking savory vegan delights, wholesome gluten-free meals, or dairy-free indulgences, we've got you covered! Our user-friendly filtering, through integrating Apple ensure you can locate local farmer markets and organic farms with ease.")
                                   )})
                            
                        }
                        
                        HStack {
                            //----------------------------------------------------
                            Button (
                                action : { presentAlert4 = true},
                                label : {Text("🛤️")
                                    .font(.system(size: 50))
                                    .padding()
                                    .background(Rectangle()
                                    .foregroundColor(.white))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding(.horizontal)
                            })
                            .alert(isPresented: $presentAlert4,
                                   content : { Alert(
                            title: Text("Your Sustainable Journey"),
                            message: Text("Our commitment to sustainability extends beyond our recipes. With the integration of the USDA Organic Integrity Database API, you can be assured that the ingredients you use are certified organic.")
                                   )})

                            //----------------------------------------------------
                            Button (
                                action : { presentAlert5 = true},
                                label : {Text("🌎")
                                    .font(.system(size: 50))
                                    .padding()
                                    .background(Rectangle()
                                    .foregroundColor(.white))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding(.horizontal)
                            })
                            .alert(isPresented: $presentAlert5,
                                   content : { Alert(
                            title: Text("Nourishing Our Planet"),
                            message: Text("We believe that the choices we make today shape the world we inherit tomorrow. You can be a part of a movement that celebrates and champions organic, sustainable farming practices.")
                                   )})
                        }
                        
                        Text("We can make a difference – one \"SustainaBite\" at a time.")
                            .font(Font.custom("Poppins-Medium", size: 20))
                            .foregroundColor(Color("darkGreen"))
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(.white))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal, 17)
                            .padding(.vertical)
                        
                        
                    }
                }.frame(maxHeight: .infinity)
            }.background(Color("almond").ignoresSafeArea())
            
                .toolbar {
                    ToolbarItemGroup(placement: .status) {
                        NavigationLink(destination: WelcomeView()) {
                            Image("homeIcon")
                                .resizable(capInsets: EdgeInsets())
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical)
                                .frame(width: 100.0, height: 80.0)
                        }
                        .padding(.top)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(false)
                        
                        NavigationLink(destination: MapView()) {
                            Image("mapIcon")
                                .resizable(capInsets: EdgeInsets())
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical)
                                .frame(width: 100.0, height: 80.0)
                                .padding(.horizontal, -30)
                        }
                        .padding(.top)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(false)
                        
                        
                        NavigationLink(destination: FoodView()) {
                            Image("searchIcon")
                                .resizable(capInsets: EdgeInsets())
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical)
                                .frame(width: 100.0, height: 80.0)
                                .padding(.trailing, -30)
                        }
                        .padding(.top)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(false)
                       
                        NavigationLink(destination: AboutView()) {
                            Image("infoIcon")
                                .resizable(capInsets: EdgeInsets())
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical)
                                .frame(width: 100.0, height: 80.0)
                        }
                        .padding(.top)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }

                }
        }.navigationBarBackButtonHidden(true)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
