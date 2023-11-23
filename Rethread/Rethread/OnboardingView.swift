// ContentView.swift

import SwiftUI

struct OnboardingView: View {
    // Onboarding state

    enum Section: CaseIterable {
        case welcome, gender, clothingFrequency, spendingFrequency
        var next: Section? {
            let index = Self.allCases.firstIndex(of: self)! + 1
            guard index < Self.allCases.count else {
                return nil
            }
            return Self.allCases[index]
        }
    }

    @State private var section = Section.welcome
    @State private var profile = Profile()
    @State private var isDisplayingAlert = false

    var body: some View {
        VStack {
            Group {
                switch section {
                case .welcome:
                    welcomeSection
                case .gender:
                    addGenderSection
                case .clothingFrequency:
                    howOftenSection
                case .spendingFrequency:
                    howMuchSection
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)
            ))

            bottomButton
                .padding(30)
        }
        .background(.purple)
        .alert("Oops!", isPresented: $isDisplayingAlert) {
            Button("Ok") {

            }
        } message: {
            Text("You need to select an option before continuing.")
        }

    }
}

#Preview {
    OnboardingView()
}

// MARK: COMPONENTS

extension OnboardingView {

    @ViewBuilder private var bottomButton: some View {
        let text = section == .welcome ? "Get Started" : section == Section.allCases.last ? "Finish" : "Next"
        Button(text) {
            handleNextButtonPressed()
        }
        .buttonStyle(.onboarding)
        .tint(.white)
        .foregroundStyle(.purple)
    }

    private var welcomeSection: some View {
        VStack {
            Text("Hey! \nWelcome to ReThread.\n")
            Image(systemName: "tshirt.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
            Text("Discover low priced and sustainable fashion")
        }
        .font(.title)
        .foregroundStyle(.white)
    }

    private var addGenderSection: some View {
        VStack(spacing: 16) {
            Text("Whats your gender?")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)

            ForEach(Gender.allCases) { gender in
                let isSelected = gender == profile.gender
                Button(gender.displayString) {
                    profile.gender = gender
                }
                .buttonStyle(.onboarding)
                .foregroundColor(isSelected ? .white : .purple)
                .tint(isSelected ? .red : .white)
            }
        }
        .padding(.horizontal, 20)
    }

    private var howOftenSection: some View {
        VStack(spacing: 16) {
            Text("How often do you buy clothes?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)

            ForEach(ClothingFrequency.allCases) { clothingFreq in
                let isSelected = clothingFreq == profile.clothingFreq
                Button(clothingFreq.clothingFreqDispalyString) {
                    profile.clothingFreq = clothingFreq
                }
                .buttonStyle(.onboarding)
                .foregroundColor(isSelected ? .white : .purple)
                .tint(isSelected ? .red : .white)
            }
            .padding(.horizontal, 20)
        }
    }

    private var howMuchSection: some View {
        VStack(spacing: 16) {
            Text("How much do you spend on clothes?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()

            ForEach(SpendingFrequency.allCases) { spending in
                let isSelected = spending == profile.spendingFreq
                Button(spending.spendingDisplayString) {
                    profile.spendingFreq = spending
                }
                .buttonStyle(.onboarding)
                .foregroundColor(isSelected ? .white : .purple)
                .tint(isSelected ? .red : .white)
            }
        }
        .padding(.horizontal, 20)
    }
}

// MARK: FUNCTIONS

extension OnboardingView {
    
    var hasSelectedOption: Bool {
        switch section {
        case .welcome: true
        case .gender: profile.gender != nil
        case .clothingFrequency: profile.clothingFreq != nil
        case .spendingFrequency: profile.spendingFreq != nil
        }
    }

    func handleNextButtonPressed() {
        guard hasSelectedOption else {
            isDisplayingAlert = true
            return
        }
        if section == Section.allCases.last {
            // sign in
        } else {
            withAnimation(.spring()) {
                section = section.next ?? Section.allCases.last!
            }
        }
    }
}
