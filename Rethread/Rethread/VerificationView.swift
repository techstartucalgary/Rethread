import SwiftUI

struct VerificationView: View {
    @Binding var currentUserSignedIn: Bool
    @State private var code: String = ""
    
    var body: some View {
        VStack {
            Text("Verify your account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 60)
            
            Text("Enter the 4-digit PIN code sent to your email address xxx@example.com.")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: Binding(
                        get: { String(self.code.prefix(index + 1).suffix(1)) },
                        set: { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            guard !filtered.isEmpty else { return }
                            self.code = String(self.code.prefix(index)) + filtered + String(self.code.dropFirst(index + 1))
                            if self.code.count > 4 {
                                self.code = String(self.code.prefix(4))
                            }
                        }
                    ))
                    .frame(width: 44, height: 44)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                }
            }
            .padding()
            
            Button("Verify") {
                // Handle verification action
                self.currentUserSignedIn = true // Simulate successful verification
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding()
            
            Button("Request new code") {
                // Handle request new code action
            }
            
            Spacer()
        }
    }
}
