// ScannerView.swift

import SwiftUI

struct ScannerView: View {
    @State private var uploadedImage: UIImage?
    var body: some View {
        VStack {
            Text("You can earn points by scanning a sustainable tag. The camera recognizes the information and analyzes your purchase. Open the camera to take a picture. Or upload your own!")
                .padding(.top, 100)
                .padding(.horizontal,30)
                .font(.title)

            CameraPicker(image: $uploadedImage)
                .padding()
            Spacer()

        }

    }
}

#Preview {
    ScannerView()
}
