//
//  MapView.swift
//  sustainaBite
//
//  Created by scholar on 7/19/23.
//

import SwiftUI
import MapKit

struct MapSecond: View {
    
    private var listOfStores = storeList
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(stores, id: \.self) { store in
                    HStack {
                        Text(store.capitalized)
                            .foregroundColor(Color(hue: 0.535, saturation: 0.418, brightness: 0.639))
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
            .searchable(text: $searchText)
            .navigationTitle("Organic Stores")
        }
    }
    
    var stores: [String] {
        let lcStores = listOfStores.map { $0.lowercased() }
        return searchText == "" ? lcStores : lcStores.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct MapSecond_Previews: PreviewProvider {
  static var previews: some View {
    MapSecond()
  }
}
