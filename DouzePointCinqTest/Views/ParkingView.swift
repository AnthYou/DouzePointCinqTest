//
//  ParkingView.swift
//  DouzePointCinqTest
//
//  Created by Anthony You on 28/10/2021.
//

import SwiftUI

struct ParkingView: View {
    @Environment(\.colorScheme) var colorScheme
    var parking: Parking

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var showingAlert = false

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Label(parking.address, systemImage: "mappin.and.ellipse")
                    .multilineTextAlignment(.leading)
                Label("Parking privé accessible par téléphone", systemImage: "lock.rotation")
                Label("Précommande", systemImage: "clock.arrow.circlepath")
                Label("Nouveau parking 12.5", systemImage: "info.circle")
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.primary, lineWidth: 1)
            )

            Spacer()

            LazyVGrid(columns: columns) {
                ForEach(parking.gates) { gate in
                    VStack(spacing: 20) {
                        HStack {
                            Text(gate.name)
                                .font(.headline)

                            Spacer()

                            Button {
                                self.showingAlert = true
                            } label: {
                                Image(systemName: "info.circle")
                            }

                        }

                        Image("garage")
                            .resizable()
                            .if(colorScheme == .dark) { view in
                                view.colorInvert()
                            }
                            .frame(width: 50, height: 50)
                        Link("Ouvrir", destination: URL(string: "tel:\(gate.phoneNumber)")!)
                    }
                    .padding()
                    .frame(maxWidth: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(Color.primary, lineWidth: 1)

                    )
                }
            }
        }
        .navigationTitle(parking.name)
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Information"),
                message: Text("Pour ouvrir le portail, tapez sur \"Ouvrir\" puis appellez le numéro qui s'affiche. Le portail s'ouvrira à la réception de l'appel."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ParkingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParkingView(parking: Parking.allParkings.first!)
        }
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
