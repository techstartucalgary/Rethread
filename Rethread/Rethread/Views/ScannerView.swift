// ScannerView.swift

import SwiftUI

struct ScannerView: View {
    @State private var uploadedImage: UIImage?
    private var scanner = ScannerViewModel()
    var body: some View {
        VStack {
            Text("You can earn points by scanning a sustainable tag. The camera recognizes the information and analyzes your purchase. Open the camera to take a picture. Or upload your own!")
                .padding(.top, 100)
                .padding(.horizontal,30)
                .font(.title)

            CameraPicker(image: $uploadedImage)
                .padding()
            Spacer()


            Button("Upload Image") {
                print("Upload button tapped")
                if let image = uploadedImage {
                        let base64String = scanner.convertImageToBase64(img: image)
                        if !base64String.isEmpty {
                            print("Image is available for upload")
                            scanner.uploadImageToScanner(base64String: base64String)
                        } else {
                            print("Image could not be converted to Base64")
                        }
                    }
            }

        }

    }
}



#Preview {
    ScannerView()
}
