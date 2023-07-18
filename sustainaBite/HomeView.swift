//
//  HomeView.swift
//  sustainaBite
//
//  Created by scholar on 7/17/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("hello")
            }
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    NavigationLink(destination: FoodView()) {
                        Text("❓")
                            .font(.system(size: 56))
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(false)
                    
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
