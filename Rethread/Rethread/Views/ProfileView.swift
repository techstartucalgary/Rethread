// ProfileView.swift

import SwiftUI
import PhotosUI



enum SectionType {
    case promotions
    case accountSettings
    case notifications
    case logout
}


extension SectionType {

    @ViewBuilder func view(viewModel: AuthViewModel) -> some View {
        
        switch self {
        case .promotions:
            MainView()
        case .accountSettings:
            AccountSettingsView()
        case .notifications:
            AccountNotificationView()
        case .logout:
            Button(action: {
                Task {
                    await viewModel.signOut()
                }
            }, label: {
                Text("Log Out")
                    .foregroundStyle(.white)
            })
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
    }
}

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    @State private var profileName: String = "Parsa Kargari"
    @State private var profileImage: UIImage? = UIImage(named: "king")

    var sections: [Sections] = [
        .init(name: "Points and Promotions", icon: "ticket", color: Color(hex: "#2C4C52"), destinations: .promotions),

            .init(name: "Account Settings", icon: "pencil", color: Color(hex: "#2C4C52"), destinations: .accountSettings),

            .init(name: "Notifications", icon: "bell", color: Color(hex: "#2C4C52"), destinations: .notifications),

            .init(name: "Log Out", icon: "door.right.hand.open", color: Color(hex: "#2C4C52"), destinations: .logout),
    ]


    var body: some View {
            NavigationStack {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image(uiImage: profileImage ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 160, maxHeight: 160)
                            .border(Color(hex: "#2C4C52"), width: 5)
                            .cornerRadius(5)
                            .padding()
                        PhotoPicker(image: $profileImage)

                    }
                    Text(profileName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: "#2C4C52"))
                    CameraPicker(image: $profileImage)
                        .padding(.bottom)
                }

                List {
                    ForEach(sections, id: \.name) { section in
                        NavigationLink(destination: section.destinations.view(viewModel: viewModel)) {
                            Label(section.name, systemImage: section.icon)
                                .foregroundStyle(section.color)
                        }
                    }
                }
                .listStyle(.insetGrouped)

            }

    }
}

struct Sections: Hashable {
    let name: String
    let icon: String
    let color: Color
    let destinations: SectionType
}


struct PhotoPicker: View {
    @State private var selectedItem: PhotosPickerItem?
    @Binding var image: UIImage?

    var body: some View {

        VStack {

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Image(systemName: "square.and.pencil.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(Color(hex: "#2C4C52"))
                    .clipShape(Circle(), style: FillStyle())
            }
            .photosPickerStyle(.presentation)
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        image = UIImage(data: data)
                    } else {
                        print("Failed to load the image")
                    }
                }
            }
        }
    }
}

struct CameraPicker: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @Binding var image: UIImage?
    var body: some View {
        VStack {
            if let selectedImage{
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
            }

            Button(action: {
                self.showCamera.toggle()

            }, label: {
                Text("Open camera")
                Image(systemName: "camera")
            })
            .tint(.gray)
            .buttonStyle(.borderedProminent)
            .fullScreenCover(isPresented: self.$showCamera) {
                accessCameraView(selectedImage: self.$selectedImage)
            }
        }
    }
}

#Preview {
    ProfileView()
}
