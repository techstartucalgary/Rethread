
import SwiftUI



struct GenBottomsView: View {


    @State private var selectedType: ClothingType? = nil
    @State private var selectedStyle: ClothingStyle? = nil
    @State private var maxPrice: Int = 500
    private var fetcher = FetchClothing()


    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var filteredItems: [ClothingItem] {
        fetcher.genBottoms.filter { item in
            (selectedType == nil || item.type == selectedType) &&
            (selectedStyle == nil || item.style == selectedStyle) &&
            item.price <= maxPrice
        }
    }


    var body: some View {
        NavigationStack {
        ScrollView(showsIndicators: false) {
            VStack {
                Image("bottomsCover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            Spacer()

            VStack(alignment: .leading) {
                VStack {
                    Picker("Style", selection: $selectedStyle) {
                        Text("All").tag(ClothingStyle?.none)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                        ForEach(ClothingStyle.allCases, id: \.self) { style in
                            Text(style.rawValue).tag(style as ClothingStyle?)
                        }
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
                Text("Shop Bottoms")
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
        .onAppear {
            fetcher.fetchClothing()
        }
        .tint(Color(hex: "#2C4C52"))
        }
    }



#Preview {
    GenBottomsView()
}


