import SwiftUI

struct WelcomeView: View {
    var action: () -> Void

    var body: some View {
        VStack {
            // Video placeholder
            Rectangle()
                .foregroundColor(.black.opacity(0.1))
                .overlay(
                    Image(systemName: "video.fill") // Video icon placeholder
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(1)
                )
            
            Spacer()
            
            VStack(alignment: .center, spacing: 40.0) {
                
                Text("Hi, Parsa!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 30)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                Button("Get Started", action: action)
                    .buttonStyle(PrimaryButtonStyle(width: 200, height: 20))
                    .padding(.bottom, 55.0)
                    .padding(.top)
                
            }
            .frame(maxWidth: .infinity)  // Ensure VStack takes full width
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color(UIColor.systemGray6))
    }
}
