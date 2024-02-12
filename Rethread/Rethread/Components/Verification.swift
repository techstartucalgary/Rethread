import SwiftUI


struct Verification: View {
    @Binding var otpFields: [String]
    @State var otpText: String
    
    // Text Field Focus State
    @FocusState var activeField: OTPField?
    
    var body: some View {
        VStack {
            OTPField()
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .onChange(of: otpFields) { newValue in
            OTPCondition(value: newValue)
        }
    }
    
    func checkStates()->Bool {
        for index in 0..<6 {
            if otpFields[index].isEmpty { return true }
        }
        
        return false
    }
    
    // MARK: Only one character per input & Moving
    func OTPCondition(value: [String]) {
        
        // Move Front
        for index in 0..<5 {
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
                activeField = activeStateForIndex(index: index + 1)
            }
        }
        
        //Move back if current is empty and back is not
        for index in 1...5 {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeField = activeStateForIndex(index: index - 1)
            }
        }
        
        for index in 0..<6 {
            if value[index].count > 1 {
                otpFields[index] = String(value[index].last!)
            }
        }
    }
    
    @ViewBuilder
    func OTPField()->some View {
        HStack(spacing: 14) {
            ForEach(0..<6, id: \.self) { index in
                VStack (spacing: 8) {
                    TextField("", text: $otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .frame(width: 45, height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(
                            activeField == activeStateForIndex(index: index) ? Color.primaryDark.opacity(0.4) : Color.primaryDark,
                            lineWidth: 1))
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                        
                }
                .frame(width: 40)
            }
        }
    }
    
    func activeStateForIndex (index: Int) -> OTPField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
}

enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}

#Preview {
    Verification(otpFields: .constant(["","","","","",""]), otpText: "")
}
