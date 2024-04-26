import SwiftUI
import SwiftfulLoadingIndicators

struct ScannerResultsView: View {
    private var scanner = ScannerViewModel()
    private var mode = ScannerViewModel()


    var body: some View {
        VStack {
            if scanner.isProcessing {
                LoadingIndicator(animation: .circleRunner, color: Color(hex: "2C4C52"), size: .large, speed: .fast)
                    .padding()
                Text("Scanning...")
                    .foregroundStyle(Color(hex: "2C4C52"))
                    .font(.title2)
                    .fontWeight(.semibold)
            } else {
                ScannedResultsView()
            }
        }
    }
}

#Preview {
    ScannerResultsView()
}
