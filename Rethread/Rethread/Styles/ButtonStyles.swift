// ButtonStyles.swift

import SwiftUI

struct ConfigurableButtonStyle: ButtonStyle {
    var applyStyle: (Configuration) -> AnyView

    func makeBody(configuration: Configuration) -> some View {
        applyStyle(configuration)
    }
}

extension ButtonStyle where Self == ConfigurableButtonStyle {
    static func configurable(_ isLastStep: Bool, isEnabled: Bool) -> Self {
        ConfigurableButtonStyle { configuration in
            if isLastStep {
                return AnyView(LetStartButtonStyle(isEnabled: isEnabled).makeBody(configuration: configuration))
            } else {
                return AnyView(NextButtonStyle(isEnabled: isEnabled).makeBody(configuration: configuration))
            }
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    // Button background color #667080
    // Rounded corners
    // Take in width and height as parameters?
    var width: CGFloat = 100
    var height: CGFloat = 20
    var isDisabled: Bool = false

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height) // Use optional binding in case width and height are not provided
            .padding()
            .background(configuration.isPressed || isDisabled ? Color.GrayDisabled : Color.primaryDark)
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
            .background(configuration.isPressed ? Color.GrayDisabled : Color.Secondary)
            .cornerRadius(9)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct PreviousButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 70, height: 60)
            .background(
                RoundedCorners(
                    color: !configuration.isPressed ? Color.primaryDark : Color.primaryDark.opacity(0.5),
                    tl: 0,
                    tr: 7,
                    bl: 0,
                    br: 7
                )
            )
    }
}

struct NextButtonStyle: ButtonStyle {
    var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 70, height: 60)
            .background(
                RoundedCorners(
                    color: isEnabled && !configuration.isPressed ? Color.Secondary : Color.Secondary.opacity(0.5),
                    tl: 7,
                    tr: 0,
                    bl: 7,
                    br: 0
                )
            )
    }
}

struct LetStartButtonStyle: ButtonStyle {
    var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 140, height: 60)
            .background(
                RoundedCorners(
                    color: isEnabled && !configuration.isPressed ? Color.Secondary : Color.Secondary.opacity(0.5),
                    tl: 7,
                    tr: 0,
                    bl: 7,
                    br: 0
                )
            )
    }
}

struct RoundedCorners: View {
    var color: Color = .white
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}



