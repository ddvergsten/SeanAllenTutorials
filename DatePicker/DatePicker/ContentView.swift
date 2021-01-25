//
//  ContentView.swift
//  DatePicker
//
//  Created by David Dvergsten on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var birthdate = Date()
    var body: some View {
        Form{
            DatePicker("Birthdate", selection: $birthdate).datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
