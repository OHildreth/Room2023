//
//  RooDataModel_1.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/27/23.
//

import Foundation

class RoomDataModel_1: ObservableObject {
    @Published var numberOfStudents = 0
    @Published var numberOfTeachers = 0  {
        didSet {
            print("Number of Teachers = \(numberOfTeachers)")
        }
    }
}




struct RoomDataModel_2: Codable {
    private var _numberOfStudents: UInt = 0
    private var _numberOfTeachers: UInt = 0
    
    var numberOfStudents: Int {
        get {Int(_numberOfStudents)}
        set {
            if newValue < 0 {
                _numberOfStudents = 0
            } else {
                _numberOfStudents = UInt(newValue)
            }
        }
    }
    
    
    var numberOfTeachers: Int {
        get {Int(_numberOfTeachers)}
        set {
            if newValue < 0 {
                _numberOfTeachers = 0
            } else {
                _numberOfTeachers = UInt(newValue)
            }
        }
    }
}
