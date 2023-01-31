//
//  OccupantType.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/27/23.
//

import Foundation

enum OccupantType: String, CaseIterable, Equatable, Codable {
    case student
    case teacher
    
    var name: String {
        return self.rawValue.capitalized
    }
}
