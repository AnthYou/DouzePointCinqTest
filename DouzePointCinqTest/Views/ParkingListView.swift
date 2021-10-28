//
//  ParkingListView.swift
//  DouzePointCinqTest
//
//  Created by Anthony You on 28/10/2021.
//

import SwiftUI

struct ParkingListView: View {
    var body: some View {
        List {
            ForEach(Parking.allParkings) { parking in
                Text(parking.name)
            }
        }
        .navigationTitle("Parkings")
    }
}

struct ParkingListView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingListView()
    }
}
