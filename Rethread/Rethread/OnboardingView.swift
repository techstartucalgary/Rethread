import SwiftUI

struct OnboardingStep {
    let question: String
    let options: [String]
    let maxSelections: Int
}

let onboardingSteps = [
    OnboardingStep(question: "What is your favorite color?", 
                   options: ["Red", "Green", "Blue", "Purple"],
                   maxSelections: 1),
    
    OnboardingStep(question: "What is your favorite animal?",
                   options: ["Dog", "Cat", "Bird"],
                    maxSelections: 2),
    
    OnboardingStep(question: "What is your favorite food?",
                   options: ["Pizza", "Pasta", "Burgers"],
                     maxSelections: 1)
]

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var selectedOptions = [[String]](repeating: [], count: onboardingSteps.count)
    let onboardingStepsCount = onboardingSteps.count
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
            VStack (spacing: 0) {
                TabView(selection: $currentStep ) {
                    ForEach(0..<onboardingStepsCount, id: \.self) { index in
                        VStack {
                            Text(onboardingSteps[index].question)
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.top, 50)
                                .padding(.bottom, 40)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                            
                            ForEach(onboardingSteps[index].options, id: \.self) { option in
                                OptionRow(
                                    option: option,
                                    isSelected: selectedOptions[index].contains(option),
                                    toggleSelection: {
                                        // Let the user select up to `maxSelections` options
                                        // If the user has already selected `maxSelections` options, remove the first option
                                        
                                        if selectedOptions[index].contains(option) {
                                            selectedOptions[index].removeAll(where: { $0 == option })
                                        } else if selectedOptions[index].count < onboardingSteps[index].maxSelections {
                                            selectedOptions[index].append(option)
                                        } else {
                                            selectedOptions[index].removeFirst()
                                            selectedOptions[index].append(option)
                                        }
                                    }
                                )
                                .padding(.horizontal, 23)
                            }
                            Spacer()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.default, value: currentStep)
                .onChange(of: currentStep) { newValue in
                    if newValue > 0 && selectedOptions[newValue - 1].isEmpty {
                        currentStep -= 1
                    }
                }
                
                Spacer()
                
                HStack (spacing: 0) {
                    Button(action: previousStep) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                    }
                    .buttonStyle(PreviousButtonStyle())

                    Spacer()
                    
                    
                    HStack {
                        ForEach(0..<onboardingStepsCount, id: \.self) { it in
                            if it == currentStep {
                                Rectangle()
                                    .frame(width: 20, height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(Color.primaryColor)
                            } else {
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color(red: 170/255, green: 177/255, blue: 187/255))
                            }
                        }
                    }
                    .transition(.slide) // This applies the transition to the entire
                    .animation(.easeInOut, value: currentStep)

                    Spacer()
                    
                    Button(action: isLastStep() ? finishOnboarding : nextStep) {
                        if isLastStep() {
                            Text("Let's Start")
                                .font(.body)
                        } else {
                            Image(systemName: "chevron.right")
                                .font(.title)
                        }
                    }
                    .buttonStyle(.configurable(isLastStep(), isEnabled: isCurrentStepValid()))
                    .disabled(!isCurrentStepValid())
                }
            }
    }

    func isLastStep() -> Bool {
        currentStep == onboardingStepsCount - 1
    }
    
    func previousStep() {
        withAnimation {
            if currentStep > 0 {
                currentStep -= 1
            } else {
                // Navigate to the previous screen
                // Close the presentation
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    func nextStep() {
        withAnimation {
            if currentStep < onboardingStepsCount - 1 {
                currentStep += 1
            }
        }
    }


    func isCurrentStepValid() -> Bool {
        !selectedOptions[currentStep].isEmpty
    }

    func finishOnboarding() {
        // MARK: Backend
        // Navigate to the main screen, call backend
    }

}

struct OptionRow: View {
    var option: String
    var isSelected: Bool
    var toggleSelection: () -> Void

    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(Color(red: 102/255, green: 112/255, blue: 128/255))
                .onTapGesture(perform: toggleSelection)

            Text(option)
                .foregroundColor(.black)
                .padding(.leading)
                .onTapGesture(perform: toggleSelection)

            Spacer()
        }
        .padding(.vertical, 15)
    }
}


