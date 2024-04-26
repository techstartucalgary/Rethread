// aboutBrandView.swift

import SwiftUI



struct aboutPatagoniaBrandView: View {


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
        ScrollView(showsIndicators: false) {
            VStack {
                Image("patagoniaHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            Spacer()

            VStack(alignment: .leading) {
                    Text("Patagonia's commitment to sustainablity:")
                        .foregroundStyle(Color(hex: "#2C4C52"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Text("Patagonia, founded in 1973 by Yvon Chouinard, emphasizes durable, repairable, and recyclable products, supporting a model that reduces waste and environmental impact.")
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
//                    .background(Color(hex: "#2C4C52"))
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 7, height: 10)))

                    }
                    .foregroundStyle(Color(hex: "#2C4C52"))


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
                        Image("patagoniaFont")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 30)
                        Spacer()
                    }
                    .padding(.horizontal)




                LazyVGrid(columns: columns) {
                    ForEach(filteredItems) { clothingItem in
                        ClothCard(width: 160, height: 150, clothingItem: clothingItem)
                    }
                }
                    Spacer()
                }
        .navigationTitle("Patagonia")

        }
    }


#Preview {
    aboutPatagoniaBrandView()
}
