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
