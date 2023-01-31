//
//  Overview_1.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/25/23.
//

import SwiftUI

struct Overview_1: View {
    @StateObject   var roomDataModel = RoomDataModel_1()
    
    var body: some View {
        VStack {
            HStack {
                Button("+", action: add)
                Button("-", action: {roomDataModel.numberOfTeachers -= 1})
            }
            Divider()
            Text("Students: \(roomDataModel.numberOfStudents)")
            Text("Teachers: \(roomDataModel.numberOfTeachers)")
        }
    }
    
    func add() {
        roomDataModel.numberOfTeachers += 1
    }
}

struct Overview_1_Previews: PreviewProvider {
    static var previews: some View {
        Overview_1()
    }
}
