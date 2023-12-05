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
            .background(Color(red: 102/255, green: 112/255, blue: 128/255))
            .cornerRadius(9)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
