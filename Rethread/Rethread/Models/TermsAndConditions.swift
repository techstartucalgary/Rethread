import SwiftUI

struct TermsAndConditions: View {
    var body: some View {
        VStack {
            Text("Terms & Conditions")
                .font(.title)
                .padding()
            
            ScrollView {
                Text("""
                These Terms & Conditions govern your use of the ReThread mobile application ("App") provided by TechStart ("Company"). By downloading, installing, or using the App, you agree to comply with and be bound by these Terms. If you do not agree with these Terms, please do not use the App.
                
                1. Acceptance of Terms
                By using the App, you acknowledge that you have read, understood, and agree to these Terms. If you are using the App on behalf of a company or organization, you represent and warrant that you have the authority to bind that entity to these Terms.
                
                2. App License
                The Company grants you a limited, non-exclusive, non-transferable, revocable license to use the App for your personal or internal business purposes, subject to these Terms.
                
                3. User Registration
                You may be required to create an account or provide certain information to access certain features of the App. You agree that all information you provide is accurate and up-to-date, and you will keep your account credentials secure.
                
                4. Privacy
                Your use of the App is also governed by our Privacy Policy, which can be found [Insert Link to Privacy Policy]. By using the App, you consent to the collection, use, and sharing of your information as described in the Privacy Policy.
                
                5. Prohibited Activities
                You agree not to:
                - Use the App for any illegal or unauthorized purpose.
                - Modify, adapt, or hack the App.
                - Attempt to gain unauthorized access to the App's systems or networks.
                - Engage in any activity that may interfere with the proper functioning of the App.
                
                6. Termination
                The Company reserves the right to terminate your access to the App at any time, for any reason, without notice.
                
                7. Disclaimer of Warranties
                The App is provided "as is" and "as available" without warranties of any kind, either express or implied, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement.
                
                8. Limitation of Liability
                In no event shall the Company be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from your use of the App.
                
                9. Changes to Terms
                The Company reserves the right to update or modify these Terms at any time. Any changes will be effective immediately upon posting on the App. Your continued use of the App after any such changes constitute your acceptance of the revised Terms.
                
                10. Governing Law
                These Terms shall be governed by and construed in accordance with the laws of [Insert Jurisdiction]. Any disputes arising under or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts of [Insert Jurisdiction].
                
                11. Contact Us
                If you have any questions or concerns about these Terms, please contact us at [Insert Contact Information].
                """)
                    .padding()
            }
        }
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
