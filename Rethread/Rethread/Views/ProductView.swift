// ProductView.swift

import SwiftUI


struct ProductView: View {


    
    var body: some View {
        ZStack {
            ScrollView {
                Image("sweatshirt")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(edges: .top)

                DescriptionView()
                    .offset(y: -40)

                Spacer()
            }
            HStack {
                Text("$50")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()

                Button(action: {}, label: {
                    Text("Buy now")
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
        .ignoresSafeArea(edges: .bottom)

    }
}
#Preview {
    ProductView()
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Sweatshirt")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Text("Description")
                .padding(.vertical, 4)
                .fontWeight(.medium)
            Text("A loose fitting oversized sweatshirt deisgned with comfort and sustainability in mind")
                .opacity(0.8)

            Text("Sizes")
                .padding(.vertical)
                .fontWeight(.medium)
            CustomDropdownMenu(items: [
                DropdownItem(id: 1, title: "Small", onSelect: {}),
                DropdownItem(id: 2, title: "Medium", onSelect: {}),
                DropdownItem(id: 3, title: "Large", onSelect: {}),
                DropdownItem(id: 4, title: "X-Large", onSelect: {}),

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
