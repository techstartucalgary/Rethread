// GenAccessoriesView.swift

import SwiftUI

// aboutArc'teryxBrandView.swift


import SwiftUI



struct GenAccessoriesView: View {


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
                Image("accessoryCover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            Spacer()

            VStack(alignment: .leading) {
                VStack {
                    Picker("Type", selection: $selectedType) {
                        Text("All").tag(ClothingType?.none)
                        ForEach(ClothingType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type as ClothingType?)
                        }
                    }
                    .padding(.vertical)
                    .pickerStyle(.segmented)

                    Picker("Style", selection: $selectedColor) {
                        Text("All").tag(String?.none)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                        Text("Active").tag("Active" as String?)
                        Text("Classic").tag("Classic" as String?)
                        Text("Casual").tag("Casual" as String?)
                        Text("Blue").tag("Blue" as String?)
                    }
                }
                .padding(.vertical)
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
                Text("Shop Accessories")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()



            LazyVGrid(columns: columns) {
                ForEach(filteredItems) { clothingItem in
                    NavigationLink(destination: ProductView(productImage: clothingItem.imageName, productName: clothingItem.name, productPrice: clothingItem.price).onAppear {
                    }.onDisappear {
                    }) {
                        ClothCard(width: 160, height: 150, clothingItem: clothingItem)
                    }
                }
            }
            Spacer()
        }

    }

        .tint(Color(hex: "#2C4C52"))
        }
    }



#Preview {
    GenAccessoriesView()
}
