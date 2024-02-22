// HomeView.swift

import SwiftUI
import MapKit
import PhotosUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    ZStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                HomeBarView()


                                SliderView()

                                Text("We Connect You to Sustainable Brands")
                                    .fontWeight(.semibold)
                                    .font(.largeTitle)
                                    .padding()

                                BrandCardScrollView()

                                Yap()
                                    .padding()


                                DiscoverDealsLink()



                                HStack {
                                    ClothCardDiscounted(width: 150, height: 150, clothingItem: Image("sweatshirt"), discount: "$55", oldPrice: "$80")
                                        .padding()

                                    ClothCardDiscounted(width: 150, height: 150, clothingItem: Image("sweatshirt"), discount: "$75", oldPrice: "$240")
                                        .padding()                }

                            }
                        }

                    }
                    .padding(.bottom)
                    .tabItem {
                        Image(systemName: "house")
                    }
                    ScannerView()
                        .tabItem {
                            Spacer()
                            Image(systemName: "qrcode")

                        }

                    MapView()
                        .tabItem {
                            Image(systemName: "mappin.circle.fill")
                        }
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                                .padding(.vertical)
                        }
                    }
                    .toolbarBackground(.white, for: .tabBar)

            }
        }
    }
}

#Preview {
    HomeView()
}


struct ButtonDestination {
    var destination: AnyView
}

struct SliderView: View {
    let buttonDestinations: [ButtonDestination] = [
        ButtonDestination(destination: AnyView(HomeView())),
        ButtonDestination(destination: AnyView(ProfileView())),
        ButtonDestination(destination: AnyView(ScannerView())),

    ]
    let images = ["Patagonia", "brokenplanet", "KOTN"]
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selectedIndex = 0

    var body: some View {
        ZStack(alignment: .leadingLastTextBaseline) {
            TabView(selection: $selectedIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    ZStack() {
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)

                        if index < buttonDestinations.count {
                                    NavigationLink(destination: buttonDestinations[index].destination) {
                                        Text("About this Brand")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white) // Adjust text color for visibility
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .tint(.clear)
                                    .border(.white, width: 3)
                                    .cornerRadius(4)
                                    .padding()
                                    .offset(x: 100, y: 165)
                                }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onReceive(timer, perform: { _ in
                withAnimation {
                    selectedIndex = selectedIndex < 3 ? selectedIndex + 1 : 1
                }
            })


            PageIndicator(currentIndex: $selectedIndex, count: images.count)
                .padding()

        }
        .frame(width: .infinity, height: 400)
    }
}


struct HomeBarView: View {
    @State var isShowingSheet = false
    var body: some View {
        HStack {
            Text("Hey Morteza!")
                .font(.title)
                .titleText()
                .padding(.bottom)
            Spacer()


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




struct SaveWithUsText: View {
    var body: some View {
        HStack {
            Text("Save With Us!")
                .titleText()
            Spacer()
            NavigationStack {
                NavigationLink(destination: ProductView()) {
                    Text("View All")
                        .foregroundStyle(Color(hex: "#2C4C52"))
                        .fontWeight(.semibold)
                        .underline()
                }
            }

        }
        .padding(.horizontal)
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



// MARK: EXTENSIONS

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

struct PageIndicator: View {
    @Binding var currentIndex: Int
    let count: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index || currentIndex == 3 ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(8)
        .cornerRadius(10)
    }
}

struct BrandCardScrollView: View {
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack{
                ForEach(0 ..< 4) { index in
                    BrandImageCardView(brandCard: Image("Image"), height: (index == 1 || index == 2) ? 150 : 110)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct BrandImageCardView: View {
    let brandCard: Image
    let height: CGFloat
    var body: some View {
        HStack {
            brandCard
                .brandCard(height: height)
        }
    }
}

extension Image {
    func brandCard(height: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: .infinity, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.bottom, 5)
//            .shadow(color: .gray, radius: 2, x: 5, y: 5)

    }
}


struct Yap: View {
    var body: some View {
        Text("Use ReThread Points to Enjoy Sustainable Discounts.")
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .font(.largeTitle)


        Text("By scanning a sustainable clothes tag, you can earn points depending on the product quality and how you are close to your personality.")
            .font(.title3)
            .multilineTextAlignment(.center)
    }
}

struct Line: View {
    var body: some View {
        VStack {
            Divider().background(Color.gray)
                .frame(height: 4)
                .overlay(.red)
        }
        .frame(width: 70)
        .padding()
    }
}

struct ClothCard: View {
    let width: CGFloat
    let height: CGFloat
    let clothingItem: Image
    var body: some View {
        VStack (alignment: .leading) {
            clothingItem
                .resizable()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("Sweat Shirt")
                .font(.subheadline)
            Text("$55")
                .font(.subheadline)
        }
    }
}

struct ClothCardDiscounted: View {
    let width: CGFloat
    let height: CGFloat
    let clothingItem: Image
    let discount: String
    let oldPrice: String
    var body: some View {
        VStack (alignment: .leading) {
            clothingItem
                .resizable()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("Sweat Shirt")
                .font(.subheadline)
            HStack {
                Text(discount)
                    .font(.subheadline)
                    .foregroundStyle(.red)
                Text(oldPrice)
                    .font(.subheadline)
                    .strikethrough()
            }
        }
    }
}


struct DiscoverDealsLink: View {
    var body: some View {
        VStack {
            Text("Discover Our Deals")
                .font(.title)

            Button(action: {}, label: {
                Text("View All")
                    .font(.title2)
                    .foregroundStyle(.red)
            })
            .buttonStyle(.plain)


        }
        .padding()
        .border(.blue, width: 4)
    }
}

