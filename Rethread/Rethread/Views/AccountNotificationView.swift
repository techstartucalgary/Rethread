// AccountNotificationView.swift

import SwiftUI

struct AccountNotificationView: View {
    var body: some View {

        VStack(alignment: .leading) {
            NotificationComponent(title: "Application Notifications", content: "Click to enable push notifications sent by reThread")

            NotificationComponent(title: "Email Notification", content: "Click to be notified of updates and promotions through your email")
            Spacer()
        }
        .padding(.vertical,100)
    }
}

#Preview {
    AccountNotificationView()
}

struct NotificationComponent: View {
    var title: String
    var content: String
    @State private var isOn = true


    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .padding(.horizontal)
        HStack {
            Toggle(isOn: $isOn, label: {
                Text(content)
            })
            .tint(.blue)
            .padding(.horizontal)
            .padding(.bottom, 32)

        }
    }
}
