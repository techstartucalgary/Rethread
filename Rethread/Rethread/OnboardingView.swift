// ContentView.swift

import SwiftUI

struct OnboardingView: View {
    // Onboarding state

    @State var onboaringState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))

    var body: some View {
        ZStack {
            ZStack {
                switch  onboaringState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addGenderSection
                        .transition(transition)
                case 2:
                    howOftenSection
                        .transition(transition)
                case 3:
                    howMuchSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.red)
                }
            }

            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .background(.purple)
    }
}

#Preview {
    OnboardingView()
}

// MARK: COMPONENTS

extension OnboardingView {

    private var bottomButton: some View {
        Text(onboaringState == 0 ? "Get Started" :
                onboaringState == 3 ? "Finish" :
                "Next"
        )
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .padding([.leading, .trailing], 12)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }

    private var welcomeSection: some View {
        VStack {
            Spacer()
            Text("Hey! \nWelcome to Fashion App.\n")
            Image(systemName: "tshirt.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
            Text("Discover low priced and sustainable fashion")
            Spacer()
            Spacer()
        }
        .font(.title)
        .foregroundStyle(.white)
    }

    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("Whats your gender?")
                .padding(.top, 60)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            Text ("🧍‍♂️Male")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Text ("🧍‍♀️Female")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Text ("🧍Non-Binary")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Text ("❓Other")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Spacer()
            Spacer()
            Spacer()
        }
    }

    private var howOftenSection: some View {
        VStack {
            Spacer()
            Text("How often do you buy clothes?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            Text ("💤 1-3 times a year")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("🤏 Every 2-3 months")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)

                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("🔄 1-2 times a month")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("💅 3-4 times a month")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("🛍️ 5+ times a month")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()


        }
    }

    private var howMuchSection: some View {

        VStack {
            Spacer()

            Text("How much do you spend on clothes?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
            Text ("😞💰 $0 - $100")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("🥺 $100 - $300")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)

                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("🤷‍♂️💸 $300 - $500")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("💸 $500 - $800")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)

            Text ("👑 $800+")
                .frame(height: 55, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .padding(.top, 30)
            Spacer()
            Spacer()
            Spacer()
            Spacer()

        }
    }
}

// MARK: FUNCTIONS

extension OnboardingView {
    
    func handleNextButtonPressed() {

        if onboaringState == 3 {
            // sign in
        }
        else {
            withAnimation(.spring()) {
                onboaringState += 1
            }
        }
    }
}
