// ClothingItemView.swift

import SwiftUI

struct ClothingItemView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    @State private var isHidden = false


    var body: some View {

            VStack {
                VStack {
                    HomeBarView()
                    MainSearchBar()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                withAnimation {
                                        isHidden.toggle()
                                    }
                            }, label: {
                                Text("Category")
                                Image(systemName: "chevron.down")
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                    .stroke(Color(hex: "#2C4C52"))
                            )



                            Button(action: {
                            }, label: {
                                Text("Color")
                                Image(systemName: "chevron.down")
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                    .stroke(Color(hex: "#2C4C52"))
                            )


                            Button(action: {}, label: {
                                Text("Gender")
                                Image(systemName: "chevron.down")

                            })
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundStyle(Color(hex: "#2C4C52"))
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                    .stroke(Color(hex: "#2C4C52"))
                            )

                        }
                    }
                    .padding(.horizontal)
                }

                ZStack(alignment: .leading) {
                    VStack {
                        VStack() {
                            Text("PLACEHOLDER")
                                .padding()
                            Spacer()

                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        VStack {
                            Text("")

                        }
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .zIndex(5)
                    .opacity(isHidden ? 0 : 1)
                    .transition(.slide)




                    VStack {
                        HStack {
                            Text("Shirts")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)

                        
                        LazyVGrid(columns: columns) {
                            ForEach(0..<3) {index in
                                ClothCard(width: 160, height: 150, clothingItem: Image("sweatshirt"))
                            }
                        }
                        .zIndex(-1)
                        Spacer()
                    }
                }
        }
    }
}

#Preview {
    ClothingItemView()
}
