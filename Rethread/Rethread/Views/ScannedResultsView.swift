// ScannedResultsView.swift

import SwiftUI

struct ScannedResultsView: View {
    private var scanner = ScannerViewModel()
    private var responses = ["Wow! Well Done!", "Not Bad!", "Could use some work..."]
    private var score = ScannerViewModel().score
    private var note = ScannerViewModel().note


    var body: some View {

        VStack {
            if score >= 8 {
                Text(responses[0])
                    .foregroundStyle(Color(hex: "2C4C52"))
                    .font(.title)
                    .fontWeight(.bold)
            } else if score > 5 && score < 8 {
                Text(responses[1])
                    .foregroundStyle(Color(hex: "2C4C52"))
                    .font(.title)
                    .fontWeight(.bold)
            } else if score == 0 {
                Text("hello meow this is 0")
            } else {
                Text(responses[2])
                    .foregroundStyle(Color(hex: "2C4C52"))
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text("Your clothing scored a \(score) and \(note)")
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color(hex: "2C4C52"))
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

#Preview {
    ScannedResultsView()
}
