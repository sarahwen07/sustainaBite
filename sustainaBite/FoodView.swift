//
//  FoodView.swift
//  sustainaBite
//
//  Created by scholar on 7/18/23.
//

import SwiftUI

struct FoodView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("almond")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hello, world!")
                        .font(Font.custom("Poppins-Italic", size: 18))
                        .searchable(text: $searchText)
                }
            }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
