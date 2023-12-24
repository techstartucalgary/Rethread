// ButtonStyles.swift

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    // Button background color #667080
    // Rounded corners
    // Take in width and height as parameters?
    var width: CGFloat = 100
    var height: CGFloat = 20

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height) // Use optional binding in case width and height are not provided
            .padding()
            .background(configuration.isPressed ? Color(red: 170/255, green: 177/255, blue: 187/255) : Color(red: 102/255, green: 112/255, blue: 128/255))
            .cornerRadius(9)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    // Button background color #EEF1F4
    // Rounded corners
    // Take in width and height as parameters?
    var width: CGFloat = 100
    var height: CGFloat = 20

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height) // Use optional binding in case width and height are not provided
            .padding()
            .background(configuration.isPressed ? Color(red: 214/255, green: 216/255, blue: 219/255)
                                                : Color(red: 238/255, green: 241/255, blue: 244/255))
            .cornerRadius(9)
            .foregroundColor(Color(red: 84/255, green: 95/255, blue: 113/255))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct PreviousButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 70, height: 60)
            .background(UnevenRoundedRectangle(cornerRadii: .init(
                                                   topLeading: 0.0,
                                                   bottomLeading: 0.0,
                                                   bottomTrailing: 25.0,
                                                   topTrailing: 6.0),
                                                   style: .continuous)
                .fill(configuration.isPressed ? Color(red: 170/255, green: 177/255, blue: 187/255) 
                                              : Color(red: 102/255, green: 112/255, blue: 128/255)))
    }
}

struct NextButtonStyle: ButtonStyle {
    var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 70, height: 60)
            .background(UnevenRoundedRectangle(cornerRadii: .init(
                                                   topLeading: 6.0,
                                                   bottomLeading: 25.0,
                                                   bottomTrailing: 0.0,
                                                   topTrailing: 0.0),
                                                   style: .continuous)
                .fill(isEnabled ? Color(red: 102/255, green: 112/255, blue: 128/255)
                                : Color(red: 170/255, green: 177/255, blue: 187/255))) // Disabled color
    }
}

struct LetStartButtonStyle: ButtonStyle {
    var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 140, height: 60)
            .background(UnevenRoundedRectangle(cornerRadii: .init(
                                                   topLeading: 6.0,
                                                   bottomLeading: 25.0,
                                                   bottomTrailing: 0.0,
                                                   topTrailing: 0.0),
                                                   style: .continuous)
                .fill(isEnabled ? Color(red: 102/255, green: 112/255, blue: 128/255) 
                                : Color(red: 170/255, green: 177/255, blue: 187/255))) // Disabled color
    }
}



