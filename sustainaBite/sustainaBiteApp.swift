//
//  sustainaBiteApp.swift
//  sustainaBite
//
//  Created by scholar on 7/17/23.
//

import SwiftUI
import MapKit
import UIKit
@main
struct sustainaBiteApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
struct MapLocation: Identifiable {
    let id = UUID()
    let name : String
    let latitude : Double
    let longitude : Double
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
