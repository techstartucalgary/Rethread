import SwiftUI
import CustomTextField

struct CustomField: View {
    @Binding var text: String
    var titleText: String
    var placeHolderText: String
    var secureText: Bool = false
    
    var body: some View {
        EGTextField(text: $text)
            .setTitleText(titleText)
            .setTitleColor(Color.primaryDark)
            .setPlaceHolderText(placeHolderText)
            .setPlaceHolderTextColor(Color.PrimaryLight)
            .setTruncateMode(.tail)
            .setBorderColor(.primaryDark)
            .setTextColor(Color.primaryDark)
            .setDisableAutoCorrection(true)
            .setTextFieldHeight(48)
            .setFocusedBorderColorEnable(true)
            .setSecureText(secureText)
    }
}
