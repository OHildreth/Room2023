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


class RoomViewModel_2: ObservableObject, Codable {
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
    enum CodingKeys: CodingKey {
        case roomDataModel
        case selectedOccupantType
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.selectedOccupantType, forKey: .selectedOccupantType)
        try container.encode(self.roomDataModel, forKey: .roomDataModel)
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.selectedOccupantType = try container.decode(OccupantType.self, forKey: .selectedOccupantType)
        self.roomDataModel = try container.decode(RoomDataModel_2.self, forKey: .roomDataModel)
    }
    
    
    init() {
        
        registerForNotifications()
        load()
    }
    
    func registerForNotifications() {
        let nc = NotificationCenter.default
        
        nc.addObserver(self,
                       selector: #selector(appIsTerminating),
                       name: .applicationIsTerminating,
                       object: nil)
    }
    
    @objc func appIsTerminating() {
        save()
    }
}

// MARK: - Saving and Loading
extension RoomViewModel_2 {
    func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: "ViewModelState")
            
        } catch  {
            print("unables to Encode self (\(error)")
        }
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: "ViewModelState") {
            do {
                let decoder = JSONDecoder()
                let viewModel = try decoder.decode(RoomViewModel_2.self, from: data)
                
                self.roomDataModel = viewModel.roomDataModel
                self.selectedOccupantType = viewModel.selectedOccupantType
                
            } catch  {
                print("Unable to Decode RoomViewModel (\(error)")
            }
        } else {
            self.roomDataModel = RoomDataModel_2()
            self.selectedOccupantType = .teacher
        }
            
    }
}


