// ClothingItemView.swift

import SwiftUI

struct ClothingItemView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        
            VStack {
                VStack {
                    HomeBarView()
                    MainSearchBar()

                    FilterScrollView()
                }
                VStack {
                HStack {
                    Text("Shirts")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)

                LazyVGrid(columns: columns) {
                    ForEach(0..<1) {index in
                        ClothCard(width: 160, height: 150, clothingItem: Image("sweatshirt"))
                    }
                    .hidden()
                }
            }
        }
    }
}

#Preview {
    ClothingItemView()
}

struct FilterScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CustomDropdownMenu(items: [
                    DropdownItem(id: 1, title: "Categroy", onSelect: {}),
                    DropdownItem(id: 2, title: "32 Deer foot trail NE", onSelect: {}),
                    DropdownItem(id: 3, title: "18 Blvd. Road W", onSelect: {})
                ])
                .frame(idealHeight: 60)
                .frame(width: 150)


                CustomDropdownMenu(items: [
                    DropdownItem(id: 1, title: "Colour", onSelect: {}),
                    DropdownItem(id: 2, title: "32 Deer foot trail NE", onSelect: {}),
                    DropdownItem(id: 3, title: "18 Blvd. Road W", onSelect: {})
                ])
                .frame(width: 150, height: 60)

                CustomDropdownMenu(items: [
                    DropdownItem(id: 1, title: "Gender", onSelect: {}),
                    DropdownItem(id: 2, title: "32 Deer foot trail NE", onSelect: {}),
                    DropdownItem(id: 3, title: "18 Blvd. Road W", onSelect: {})
                ])
                .frame(width: 150, height: 60)


            }
        }
        .zIndex(100)
        .padding(.horizontal)
    }
}
