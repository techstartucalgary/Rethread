// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            Text("Name: Rashan Drippy")
            Text("Age: 3")
            Text("Is very sustainable ")
        }
        .foregroundStyle(.purple)
        .font(.title)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    ProfileView()
}
