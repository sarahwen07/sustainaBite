//
//  AboutView.swift
//  sustainaBite
//
//  Created by scholar on 7/18/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Hello!")
                    Image("logo")
                        .padding()
                    Image("logo")
                }
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
