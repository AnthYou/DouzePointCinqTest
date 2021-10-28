//
//  ParkingListView.swift
//  DouzePointCinqTest
//
//  Created by Anthony You on 28/10/2021.
//

import SwiftUI
import MapKit

struct ParkingListView: View {
    var body: some View {
        VStack {
            List {
                ForEach(Parking.allParkings) { parking in
                    NavigationLink(parking.name, destination: { ParkingView(parking: parking) })
                }
            }

            MapView(annotations: Parking.allParkingsAnnotations)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationTitle("Parkings")
    }
}

struct ParkingListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParkingListView()
        }
    }
}
