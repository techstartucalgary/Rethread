// HomeView.swift

import SwiftUI

struct HomeView: View {
    var body: some View {
            ZStack {
                ScrollView {
                    VStack {
                        HomeBarView()

                        MainSearchBar()

                        ScrollText() // This is just the"sustainable brands text"
                        BrandCardScrollView()

                        ShopByClothingText()

                        ClothingCardView()
                        
                        SaveWithUsText()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach (0 ..< 3) { index in
                                    ClothCard(clothingItem: Image("sweatshirt")) // This isnt the "shop by clothing card" its the real clothing

                                }
                            }
                        }
                        .padding(.horizontal)

                        
                    }
                }

                // MARK: NAV BAR

                HStack {
                    BottomNavBarItem(image: Image(systemName: "house")) {}
                    BottomNavBarItem(image: Image(systemName: "qrcode")) {}
                    BottomNavBarItem(image: Image(systemName: "mappin.circle.fill")) {}
                    BottomNavBarItem(image: Image(systemName: "person")) {}


                }
                .padding()
                .background(.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)

            }
        }
}

#Preview {
    HomeView()
}

struct HomeBarView: View {
    var body: some View {
        HStack {
            Text("Hey Morteza!")
                .font(.title2)
                .titleText()
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .foregroundStyle(Color(hex: "#2C4C52"))
        }
        .padding(.horizontal)
    }
}



extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0

        Scanner(string: cleanHexCode).scanHexInt64(&rgb)

        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct MainSearchBar: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                TextField("Search Clothes", text: $search)
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(hex: "#2C4C52"))

            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .stroke(Color(hex: "#2C4C52"))
            )
        }
        .padding()


    }
}

struct ScrollText: View {
    var body: some View {
        HStack {
            Text("Sustainable Brands")
                .titleText()

        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(.horizontal)
    }
}

struct SaveWithUsText: View {
    var body: some View {
        HStack {
            Text("Save With Us!")
                .titleText()
            Spacer()
            
            Button(action: {}, label: {
                Text("View All")
                    .foregroundStyle(Color(hex: "#2C4C52"))
                    .fontWeight(.semibold)
                    .underline()
            })
            .buttonStyle(.plain)

        }
        .padding(.horizontal)
    }
}



struct BrandImageCardView: View {
    let brandCard: Image
    var body: some View {
        HStack {
            brandCard
                .brandCard()
        }
    }
}

struct ClothingImageCardView: View {
    let clothingCard: Image
    var body: some View {
        HStack {
            clothingCard
                .clothingCard()
        }
    }
}


struct BrandCardScrollView: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0 ..< 3) { index in
                    BrandImageCardView(brandCard: Image("brandCard_\(index + 1)"))
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

// MARK: EXTENSIONS
extension Image {
    func brandCard() -> some View {
        self
            .resizable()
            .frame(width: 200, height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

extension Image {
    func clothingCard() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }

}

extension Text {
    func titleText() -> some View {
        self
            .foregroundStyle(Color(hex: "#2C4C52"))
            .fontWeight(.semibold)
            .font(.title3)
    }
}

struct ShopByClothingText: View {
    var body: some View {
        Text("Shop By Clothing")
            .titleText()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
    }
}

struct ClothingCardView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach (0 ..< 4) { index in
                    ClothingImageCardView(clothingCard: Image ("clothingCard_1"))
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct ClothCard: View {
    let clothingItem: Image
    var body: some View {
        VStack (alignment: .leading) {
            clothingItem
                .resizable()
                .frame(width: 150, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("Sweat Shirt")
                .font(.subheadline)
            Text("$55")
                .font(.subheadline)
        }
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color(hex: "#2C4C52"))
                .fontWeight(.semibold)
        })
    }
}
