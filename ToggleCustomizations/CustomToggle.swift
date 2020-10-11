//
//  CustomToggle.swift
//  ToggleCustomizations
//
//  Created by Teply, Daniel on 12/10/2020.
//

import SwiftUI

enum CustomToggleStyle {
    case switchToggle
    case checkboxToggle
    case favouriteToggle
}

struct CustomToggle: View {
    @State private var isOn = true

    private let toggleStyle: CustomToggleStyle
    private let title: String
    private let tintColor: Color

    init(toggleStyle: CustomToggleStyle, title: String, tintColor: Color) {
        self.toggleStyle = toggleStyle
        self.title = title
        self.tintColor = tintColor
    }

    var body: some View {
        switch toggleStyle {
        case .switchToggle:
            VStack {
                Toggle(isOn: $isOn, label: {
                    Text(title)
                })
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: tintColor))
            }
        case .checkboxToggle:
            VStack {
                Toggle(isOn: $isOn, label: {
                    Text(title)
                })
                .padding()
                .toggleStyle(CheckboxStyle(tintColor: tintColor))
            }
        case .favouriteToggle:
            VStack {
                Toggle(isOn: $isOn, label: {
                    Text(title)
                })
                .padding()
                .toggleStyle(FavouriteStyle(tintColor: tintColor))
            }
        }

    }
}

struct CheckboxStyle: ToggleStyle {
    let tintColor: Color

    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label

            Spacer()

            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? tintColor : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct FavouriteStyle: ToggleStyle {
    let tintColor: Color

    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label

            Spacer()

            Image(systemName: configuration.isOn ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? tintColor : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomToggle(toggleStyle: .switchToggle, title: "Switch", tintColor: .blue)
                .previewDisplayName("Switch")
                .previewLayout(.sizeThatFits)

            CustomToggle(toggleStyle: .checkboxToggle, title: "Checkbox", tintColor: .blue)
                .previewDisplayName("Checkbox")
                .previewLayout(.sizeThatFits)

            CustomToggle(toggleStyle: .favouriteToggle, title: "Favourite", tintColor: .blue)
                .previewDisplayName("Favourite")
                .previewLayout(.sizeThatFits)
        }

    }
}
