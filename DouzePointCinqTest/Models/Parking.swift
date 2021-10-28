//
//  Parking.swift
//  DouzePointCinqTest
//
//  Created by Anthony You on 28/10/2021.
//

import Foundation

struct Parking: Identifiable {
    static let allParkings = [
        Parking(id: 1, name: "Parking Ballard", address: "16, rue des Cévennes 75015 Paris", gates: [Gate(id: 1, name: "Garage", phoneNumber: 07000035551789)]),
        Parking(id: 2, name: "Parking Leblanc", address: "71, rue Leblanc 75015 Paris", gates: [Gate(id: 2, name: "Portail 1", phoneNumber: 07000035551210), Gate(id: 3, name: "Portail 2", phoneNumber: 07000035551787)]),
        Parking(id: 3, name: "Parking Procession", address: "69, rue de la Procession 75015 Paris", gates: [Gate(id: 4, name: "Portail", phoneNumber: 07000035551790)])
    ]

    let id: Int
    let name: String
    let address: String
    let gates: [Gate]
}
