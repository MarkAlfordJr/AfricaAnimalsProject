//
//  MapView.swift
//  AfricaPortfolio
//
//  Created by Mark Alford on 6/14/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    //this is the closure needed to setup initial map region location and zoom level
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    //access the data object array from the JSON file
    let location: [MapLocationModel] = Bundle.main.decoder("locations.json")
    
    
    //MARK: - Body
    var body: some View {
        //MARK: - Basic Map
        Map(coordinateRegion: $region, annotationItems: location, annotationContent: { item in
            //option A pin: old style, always static
            //item.location is the computed property
            //            MapPin(coordinate: item.location, tint: .accentColor)
            
            //option B pin: new style, always static
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //option c: custom
            MapAnnotation(coordinate: item.location) {
                //custom view for dots
                MapAnnotationView(location: item)
            }//annotation
        })//map
        .overlay(
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        //shows the coordinates of the cursor
                        Text("\(region.center.latitude)")
                    }//hstack
                    HStack{
                        Text("longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        //shows the coordinates of the cursor
                        Text("\(region.center.longitude)")
                    }//hstack
                }//vstack
                
                
            }//hstack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black)
            .cornerRadius(8)
            .opacity(0.6)
            .padding(), alignment: .top
            
        )//overlay
            
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
