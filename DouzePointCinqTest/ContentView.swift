//
//  ContentView.swift
//  DouzePointCinqTest
//
//  Created by Anthony You on 27/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Résidence")
            Link("Ouvrir le portail", destination: URL(string: "tel:+33601483989")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
