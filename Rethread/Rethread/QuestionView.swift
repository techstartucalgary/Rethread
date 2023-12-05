import SwiftUI

struct QuestionView: View {
    var question: String
    var options: [String]
    var action: () -> Void
    
    @State private var selections: Set<String> = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.title)
                .fontWeight(.bold)
                .padding()

            ForEach(options, id: \.self) { option in
                Button(action: {
                    if selections.contains(option) {
                        selections.remove(option)
                    } else {
                        selections.insert(option)
                    }
                }) {
                    HStack {
                        Image(systemName: selections.contains(option) ? "checkmark.square.fill" : "square")
                        Text(option)
                    }
                    .foregroundColor(.black)
                }
                .padding(.vertical, 5)
            }
            
            Spacer()
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                }
                Spacer()
                Button("Next", action: action)
                    .buttonStyle(PrimaryButtonStyle())
                Spacer()
                Button(action: action) {
                    Image(systemName: "arrow.right")
                }
            }
            .padding()
        }
        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(radius: 5))
        .padding()
    }
}
