//
//  FarmersMarket.swift
//  sustainaBite
//
//  Created by scholar on 7/19/23.
//

import SwiftUI
import MapKit

struct FarmersMarket: View {
    let mapLocations = [
       
        MapLocation(name: "PCC", latitude: 47.60914, longitude: -122.33529),
        MapLocation(name: "Sprouts", latitude: 47.72343, longitude: -122.34309),
        MapLocation(name: "Tiny's", latitude: 47.52183 , longitude: -122.3124 ),
        MapLocation(name:"Pikes Place", latitude: 47.60965, longitude: -122.34215),
        MapLocation(name: "NaturesM", latitude: 47.3686, longitude:  -122.20299),
        MapLocation(name: "Topb", latitude: 47.6762, longitude:  -122.37721),
        MapLocation(name: "mekong", latitude: 47.5729, longitude:  -122.29347),
        MapLocation(name: "MagFM", latitude: 47.6393, longitude:   -122.39935),
       
        
        
    ]
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
    
    var body: some View {
        
        VStack {
            Spacer()
                .foregroundColor(Color("Color"))
                .frame(height: 500.0)
            Map(coordinateRegion: $mapRegion,
                annotationItems: mapLocations,
                annotationContent: {locations in
              
          //     MapAnnotation(coordinate: locations.coordinate, content:{Text(locations.name)})
                
                MapPin(coordinate: locations.coordinate, tint: .green)
               

//                MapMarker(coordinate: locations.coordinate, tint: .red)
            })
            .padding(.all, 100.0)
            .frame(width: 500.0, height: 500.0)
            
          
        }
        .padding(.bottom, 100.0)
       
    }
}

