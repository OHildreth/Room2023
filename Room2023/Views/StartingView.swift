//
//  StartingView.swift
//  Room2023
//
//  Created by Owen Hildreth on 1/25/23.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        VStack {
            Text("DropDown - Teachers/Students")
            Divider()
            HStack {
                Text("+ Button")
                Text("- Button")
            }
            Text("Teachers: ##")
            Text("Students: ##")
        }
        
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
