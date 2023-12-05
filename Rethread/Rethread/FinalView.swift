import SwiftUI

struct FinalView: View {
    var action: () -> Void
    
    var body: some View {
        VStack {
            Text("Q3")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor.")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button("Get Started", action: action)
                .buttonStyle(PrimaryButtonStyle())
                .padding()
        }
        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(radius: 5))
        .padding()
    }
}
