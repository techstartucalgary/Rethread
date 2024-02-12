// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    @State private var profileName: String = "Parsa Kargari"
    
    var sections: [Sections] = [
        .init(name: "Points and Promotions", icon: "ticket", color: Color(hex: "#2C4C52")),

        .init(name: "Account Settings", icon: "pencil", color: Color(hex: "#2C4C52")),

        .init(name: "Notifications", icon: "bell", color: Color(hex: "#2C4C52")),
    ]




    var body: some View {
        VStack {
            Image("king")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160)
                .border(Color(hex: "#2C4C52"), width: 5)
                .cornerRadius(5)
                .padding()
            Text(profileName)
                .padding()
                .foregroundStyle(Color(hex: "#2C4C52"))
            NavigationStack {
                List {
                    ForEach(sections, id: \.name) { section in
                        NavigationLink(value: section){
                            Label(section.name, systemImage: section.icon)
                                .foregroundStyle(section.color)
                        }
                    }
                }
                .navigationDestination(for: Sections.self) { section in
                    VStack {
                        Image(systemName: "globe")
                            .foregroundStyle(section.color)
                    }
                }

            }
        }
    }
}

struct Sections: Hashable {
    let name: String
    let icon: String
    let color: Color
}


#Preview {
    ProfileView()
}
