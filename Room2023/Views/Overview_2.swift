//
//  Overview_2.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/27/23.
//

import SwiftUI

struct Overview_2: View {
    @StateObject var roomViewModel = RoomViewModel()
    
    var body: some View {
        VStack {
            Text("Drop Down Menu: Teachers/Students")
            Picker("Type", selection: $roomViewModel.selectedOccupantType) {
                ForEach(OccupantType.allCases, id: \.self) { nextType in
                    Text(nextType.rawValue)
                }
            }
            HStack {
                Button("+", action: add)
                Button("-", action: {roomViewModel.roomDataModel.numberOfTeachers -= 1})
            }
            Divider()
            Text("Students: \(roomViewModel.roomDataModel.numberOfStudents)")
            Text("Teachers: \(roomViewModel.roomDataModel.numberOfTeachers)")
        }
    }
    
    func add() {
        roomViewModel.roomDataModel.numberOfTeachers += 1
    }
}

struct Overview_2_Previews: PreviewProvider {
    static var previews: some View {
        Overview_2()
    }
}
