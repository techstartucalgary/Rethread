// aboutArc'teryxBrandView.swift


import SwiftUI



struct aboutArcteryxBrandView: View {

    @Binding var isTabBarHidden: Bool?


       @State private var selectedType: ClothingType? = nil
       @State private var selectedColor: String? = nil
       @State private var maxPrice: Int = 500

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var filteredItems: [ClothingItem] {
        ArcteryxItems.filter { item in
            (selectedType == nil || item.type == selectedType) &&
            (selectedColor == nil || item.color == selectedColor) &&
            item.price <= maxPrice
        }
    }


    var body: some View {
        NavigationStack {
        ScrollView(showsIndicators: false) {
            VStack {
                Image("arcHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            Spacer()

            VStack(alignment: .leading) {
                Text("Arc'Teryx's commitment to sustainablity:")
                    .foregroundStyle(Color(hex: "#2C4C52"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Text("Arc'teryx, founded in 1989, emphasizes the use of durable and eco-friendly materials, and actively engages in environmental stewardship, striving for minimal environmental impact.")
                    .foregroundStyle(Color(hex: "#2C4C52"))
                    .italic()
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.bottom)



                VStack {
                    Picker("Type", selection: $selectedType) {
                        Text("All").tag(ClothingType?.none)
                        ForEach(ClothingType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type as ClothingType?)
                        }
                    }
                    .pickerStyle(.segmented)

                    Picker("Color", selection: $selectedColor) {
                        Text("All").tag(String?.none)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                        Image(uiImage: ImageRenderer(content: Image(systemName: "circle.fill").foregroundStyle(.red)).uiImage!.withRenderingMode(.alwaysOriginal))
                            .tag("Red" as String?)
                        Text("Blue").tag("Blue" as String?)
                    }

                }
                .foregroundStyle(Color(hex: "#2C4C52"))

                .pickerStyle(.segmented)

                HStack {
                    Text("$0")
                    Slider(value: Binding(get: {
                        Double(maxPrice)
                    }, set: { newValue in
                        maxPrice = Int(newValue)
                    }), in: 0...500, step: 50) // Only allow integer values
                    .tint(Color(hex: "#2C4C52"))

                    Text("$\(maxPrice)")
                }
                .foregroundStyle(Color(hex: "#2C4C52"))
                .padding(.horizontal)
            }
            .padding(.horizontal)

            HStack {
                Text("Shop")
                    .font(.title2)
                    .fontWeight(.bold)
                Image("arcLetters")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 30)
                Spacer()
            }
            .padding(.horizontal)



            LazyVGrid(columns: columns) {
                ForEach(filteredItems) { clothingItem in
                    NavigationLink(destination: ProductView(productImage: clothingItem.imageName, productName: clothingItem.name, productPrice: clothingItem.price).onAppear {
                        self.isTabBarHidden = true
                    }.onDisappear {
                        self.isTabBarHidden = false
                    }) {
                        ClothCard(width: 160, height: 150, clothingItem: clothingItem)
                    }
                }
            }
            Spacer()
        }

    }
        .navigationTitle("Arc'Teryx")

        .tint(Color(hex: "#2C4C52"))
        }
    }


#Preview {
    aboutArcteryxBrandView(isTabBarHidden: .constant(false))
}

