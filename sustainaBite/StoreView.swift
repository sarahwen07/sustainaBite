//
//  StoreView.swift
//  sustainaBite
//
//  Created by scholar on 7/20/23.
//
import SwiftUI
struct StoreView: View {
  private var listOfStores = storeList
  @State var searchText = ""
  var body: some View {
    NavigationView {
      List {
     ForEach(stores, id: \.self) { store in
          HStack {
              Text(store.capitalized)
              .foregroundColor(Color("darkGreen"))
          Spacer()
        }
         
          .padding(.top)
         
        }
          
      }
      .background(Color("almond"))
      .scrollContentBackground(.hidden)
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
struct StoreView_Previews: PreviewProvider {
  static var previews: some View {
      StoreView()
  }
}
