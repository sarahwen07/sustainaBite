// MapView.swift
// sustainaBite
//
// Created by scholar on 7/19/23.
//
import SwiftUI
import MapKit
struct mapViewX: View {
 let mapLocations = [
    MapLocation(name: "PCC", latitude: 47.60914, longitude: -122.33529),
    MapLocation(name: "Firefly Kitchens", latitude: 47.66448, longitude: -122.36808),
    MapLocation(name: "Tiny's Organic", latitude: 47.52183 , longitude: -122.3124),
    MapLocation(name:"Pikes Place", latitude: 47.60965, longitude: -122.34215),
    MapLocation(name: "Caffe Umbria", latitude: 47.59947, longitude: -122.33267),
    MapLocation(name: "Top Banana", latitude: 47.6762, longitude: -122.37721),
    MapLocation(name: "Mekong Asian Market", latitude: 47.5729, longitude: -122.29347),
    MapLocation(name: "Magnolia Farmers Market", latitude: 47.6393, longitude: -122.39935),
 ]
 @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
 var body: some View {
  NavigationStack {
   ScrollView {
    VStack {
      Text("Local Groceries / Farmer Market")
      .font(Font.custom("Poppins-Medium", size: 18))
      .foregroundColor(Color("darkGreen"))
      .padding()
//      .background(Rectangle()
//        .foregroundColor(.white))
//      .cornerRadius(15)
//      .shadow(radius: 5)
     // .padding(.horizontal, -100)
      Map(coordinateRegion: $mapRegion,
      annotationItems: mapLocations,
      annotationContent: {locations in
      //       MapPin(coordinate: locations.coordinate, tint: Color("lapisBlue"))
      MapAnnotation(coordinate: locations.coordinate, content: {
        Text(locations.name).font(Font.custom("Poppins-Medium", size: 18))
        .font(.caption)
        .foregroundColor(Color("darkGreen"))
        Image(systemName: "mappin").foregroundColor(Color("lapisBlue"))
      })
      //    MapMarker(coordinate: locations.coordinate, tint: .red)
      })
      .padding(.all, 10.0)
      .frame(width: 300.0, height: 500.0)
      .background(Rectangle()
      .foregroundColor(.white))
      .cornerRadius(15)
      .shadow(radius: 5)
      // .offset(y: 15)
      NavigationLink(destination: HomeView()) {
        Text("Find grocery stores near you")
          .font(Font.custom("Poppins-SemiBold", size: 18))
          .foregroundColor(Color("darkGreen"))
          .padding()
          .background(Rectangle()
            .foregroundColor(.white))
          .cornerRadius(15)
          .shadow(radius: 5)
          .padding(.horizontal, -100)
          .offset(y: 30)
      }
    }
      .padding([.leading, .bottom, .trailing], 100.0)
    }.background(Color("almond").ignoresSafeArea())
  }
 }
}
struct mapViewX_Previews: PreviewProvider {
 static var previews: some View {
  mapViewX()
 }
}
//  MapAnnotation(coordinate: locations.coordinate, content:{Text(locations.name)})
