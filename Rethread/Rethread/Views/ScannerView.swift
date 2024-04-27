// ScannerView.swift

import SwiftUI
import SwiftfulLoadingIndicators


struct ScannerView: View {
    @State private var uploadedImage: UIImage?
    private var scanner = ScannerViewModel()
    @State private var showModel = false
    @State private var showScannedResults = false




    var body: some View {
        VStack {
            InfoView()

            HStack {
                VStack{
                    Text("Choose to upload an image or take one yourself. We'll handle the rest for you and let you know how sustainble your clothing is within seconds!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack {
                        CameraPicker(color: .white,image: $uploadedImage)
                            .foregroundStyle(Color(hex: "2C4C52"))
                    }
                    Button("Upload Image") {
                        print("Upload button tapped")
                        if let image = uploadedImage {
                            showModel.toggle() // put this inside the if let so you cant model without an image lel
                            sendImageToApi(image: image)
                        }
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                    .padding()
                    .sheet(isPresented: $showModel, content: {
                        VStack {
                                if !showScannedResults {
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
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                    showScannedResults = true
                                }
                            }
                            .presentationDetents([.medium])
                            .interactiveDismissDisabled()
                            .presentationDragIndicator(.hidden)
                    })
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "2C4C52"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onAppear {
                showScannedResults = false
            }

        }
        .padding()






    }


    func sendImageToApi(image: UIImage) {
        let base64String = scanner.convertImageToBase64(img: image)
        if !base64String.isEmpty {
            print("Image is available for upload")
            scanner.uploadImageToScanner(base64String: base64String)
        } else {
            print("Image could not be converted to Base64")
        }
    }

}



#Preview {
    ScannerView()
}

struct InfoView: View {
    var body: some View {
        HStack{
            Text("1. Scan")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "qrcode.viewfinder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)

        }
        .padding()
        .background(Color(hex: "2C4C52"))
        .clipShape(RoundedRectangle(cornerRadius: 12))

        HStack{
            Text("2. Upload")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)

        }
        .padding()
        .background(Color(hex: "2C4C52"))
        .clipShape(RoundedRectangle(cornerRadius: 12))

        HStack{
            Text("3. Track")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "chart.line.uptrend.xyaxis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)

        }
        .padding()
        .background(Color(hex: "2C4C52"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
