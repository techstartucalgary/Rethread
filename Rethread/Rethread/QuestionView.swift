import SwiftUI

struct QuestionView: View {
    var question: String
    var options: [String]
    var isLastPage: Bool
    var action: () -> Void
    var previousAction: () -> Void
    
    @Binding var selectedAnswers: [String] // Directly using the binding to manage state
    
    private func currentButtonStyle() -> AnyButtonStyle {
        if isLastPage {
            return AnyButtonStyle(LetStartButtonStyle(isEnabled: !selectedAnswers.isEmpty))
        } else {
            return AnyButtonStyle(NextButtonStyle(isEnabled: !selectedAnswers.isEmpty))
        }
    }
    
    var body: some View {
        VStack {
            Text(question)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 100)
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20.0)
            
            ForEach(options, id: \.self) { option in
                OptionRow(option: option, isSelected: selectedAnswers.contains(option)) {
                    if let index = selectedAnswers.firstIndex(of: option) {
                        selectedAnswers.remove(at: index) // Deselect the option
                    } else {
                        selectedAnswers.append(option) // Select the option
                    }
                }
            }
            .padding([.leading, .trailing], 35)

            Spacer()

            // Navigation buttons
            HStack {
                Button(action: previousAction) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                .buttonStyle(PreviousButtonStyle())

                Spacer()

                Button(action: action) {
                    if isLastPage {
                        Text("Let's Start!")
                            .font(.body)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "chevron.right")
                            .font(.title)
                    }
                }
                .buttonStyle(currentButtonStyle())
                .disabled(selectedAnswers.isEmpty)
            }
            .padding(.bottom, 70)

        }
        .background(Color(UIColor.systemGray6)) // Use the system background color
        .edgesIgnoringSafeArea(.all)
    }
}

struct AnyButtonStyle: ButtonStyle {
    private let _makeBody: (Configuration) -> AnyView
    
    init<Style: ButtonStyle>(_ style: Style) {
        self._makeBody = { configuration in AnyView(style.makeBody(configuration: configuration)) }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        self._makeBody(configuration)
    }
}
