//
//  RoomViewModel.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/27/23.
//

import Foundation

class RoomViewModel: ObservableObject {
    @Published var roomDataModel = RoomDataModel_1()
    
    @Published var selectedOccupantType: OccupantType = .teacher
}


class RoomViewModel_2: ObservableObject {
    @Published var roomDataModel = RoomDataModel_2()
    
    @Published var selectedOccupantType: OccupantType = .teacher
    
    func increment() {
        switch selectedOccupantType {
        case .student: roomDataModel.numberOfStudents += 1
        case .teacher: roomDataModel.numberOfTeachers += 1
        }
    }
    
    func decrement() {
        switch selectedOccupantType {
        case .student: roomDataModel.numberOfStudents -= 1
        case .teacher: roomDataModel.numberOfTeachers -= 1
        }
    }
    
    var shouldEnableDecrementButton: Bool {
        switch selectedOccupantType {
        case .teacher:
            if roomDataModel.numberOfTeachers <= 0 {
                return false
            } else {return true}
        case .student:
            if roomDataModel.numberOfStudents <= 0 {
                return false
            } else {return true}

        }
    }
    
    // MARK: - Codable
}
