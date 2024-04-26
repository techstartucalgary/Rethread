// ProductView.swift

import SwiftUI
import SDWebImageSwiftUI


struct ProductView: View {
    @State var productImage: String
    @State var productName: String?
    @State var productPrice: Int?
    @State var productUrl: String?
    @State var productDes: String?



    var body: some View {
        ZStack {
            ScrollView {
                WebImage(url: URL(string: productImage))
                    .resizable()
                    .aspectRatio(contentMode: .fill)


                DescriptionView(productName: productName, productDes: productDes)
                    .offset(y: -40)

                Spacer()
            }
            HStack {
                Text("$" + String(productPrice ?? 60))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()

                Button(action: {
                    if let url = URL(string: productUrl ?? "https://www.google.com/") {
                                    UIApplication.shared.open(url)
                                }
                }, label: {
                    Text("Buy now")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: "#2C4C52"))
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color(hex: "#2C4C52"))
            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 40)))
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}
//#Preview {
//    ProductView(productImage: <#String#>)
//}

struct DescriptionView: View {
    @State var productName: String?
    @State var productDes: String?

    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(productName ?? "Could Not Find Name")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Text(productDes ?? "No Description")
                .padding(.vertical, 4)
                .fontWeight(.medium)
            Text("")
                .opacity(0.8)

            Text("Sizes")
                .padding(.vertical)
                .fontWeight(.medium)
            CustomDropdownMenu(items: [
                DropdownItem(id: 1, title: "Small", onSelect: {}),
                DropdownItem(id: 2, title: "Medium", onSelect: {}),
                DropdownItem(id: 3, title: "Large", onSelect: {}),

            ])
            .zIndex(10000000)
            .frame(width: 200)
            .frame(minHeight: 200)


        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
    }
}
