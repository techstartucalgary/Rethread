import SwiftUI

struct QuestionView: View {
    var question: String
    var options: [String]
    var isLastPage: Bool
    var action: () -> Void
    var previousAction: () -> Void
    
    @State private var selectedOptions: Set<String> = []
    
    private func currentButtonStyle() -> AnyButtonStyle {
            if isLastPage {
                return AnyButtonStyle(LetStartButtonStyle(isEnabled: !selectedOptions.isEmpty))
            } else {
                return AnyButtonStyle(NextButtonStyle(isEnabled: !selectedOptions.isEmpty))
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
                HStack {
                    // Custom checkbox
                    Image(systemName: selectedOptions.contains(option) ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Color(red: 102/255, green: 112/255, blue: 128/255))
                        .onTapGesture {
                            if selectedOptions.contains(option) {
                                selectedOptions.remove(option)
                            } else {
                                selectedOptions.insert(option)
                            }
                        }

                    Text(option)
                        .foregroundColor(.black)
                        .padding(.leading)

                    Spacer()
                }
                .padding(.vertical, 15)
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
                .disabled(selectedOptions.isEmpty)
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


