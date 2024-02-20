// ProfileView.swift

import SwiftUI

enum SectionType {
    case promotions
    case accountSettings
    case notifications
}


extension SectionType {
    @ViewBuilder var view: some View {
        switch self {
        case .promotions:
            HomeView()
        case .accountSettings:
            MapView()
        case .notifications:
            ProductView()
        }
    }
}

struct ProfileView: View {
    @State private var profileName: String = "Parsa Kargari"
    
    var sections: [Sections] = [
        .init(name: "Points and Promotions", icon: "ticket", color: Color(hex: "#2C4C52"), destinations: .promotions),

            .init(name: "Account Settings", icon: "pencil", color: Color(hex: "#2C4C52"), destinations: .accountSettings),

            .init(name: "Notifications", icon: "bell", color: Color(hex: "#2C4C52"), destinations: .notifications),

            .init(name: "Log Out", icon: "door.right.hand.open", color: Color(hex: "#2C4C52"), destinations: .promotions),
    ]




    var body: some View {
        NavigationStack {
            VStack {
                Image("king")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160)
                    .border(Color(hex: "#2C4C52"), width: 5)
                    .cornerRadius(5)
                    .padding()
                Text(profileName)
                    .padding(.bottom)
                    .font(.title2)
                    .foregroundStyle(Color(hex: "#2C4C52"))

                    List {
                        ForEach(sections, id: \.name) { section in
                            NavigationLink(destination: section.destinations.view) {
                                Label(section.name, systemImage: section.icon)
                                    .foregroundStyle(section.color)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)

            }
        }
    }
}

struct Sections: Hashable {
    let name: String
    let icon: String
    let color: Color
    let destinations: SectionType
}




#Preview {
    ProfileView()
}
