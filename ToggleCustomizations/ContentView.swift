//
//  ContentView.swift
//  ToggleCustomizations
//
//  Created by Teply, Daniel on 12/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomToggle(toggleStyle: .switchToggle, title: "Switch", tintColor: .red)
            CustomToggle(toggleStyle: .checkboxToggle, title: "Checkbox", tintColor: .green)
            CustomToggle(toggleStyle: .favouriteToggle, title: "Favourite", tintColor: .blue)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
