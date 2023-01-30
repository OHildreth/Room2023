//
//  RooDataModel_1.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/27/23.
//

import Foundation

class RoomDataModel_1: ObservableObject {
    // some change
    @Published var numberOfStudents = 0
    @Published var numberOfTeachers = 0  {
        didSet {
            print("Number of Teachers = \(numberOfTeachers)")
        }
    }
}


