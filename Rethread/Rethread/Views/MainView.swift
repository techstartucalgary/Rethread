// HomeView.swift

import SwiftUI
import MapKit
import PhotosUI
import SDWebImageSwiftUI

struct HomeView: View {

    
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HomeBarView()

                SliderView()

                Text("We Connect You to Sustainable Brands")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .padding(.horizontal)
                    .padding(.top, 50)

                BrandCardScrollView()

                Yap()
                    .padding()

                DiscoverDealsLink()

                HStack {
                    ForEach(recommendedItems) { clothingItem in
                        NavigationLink(destination: ProductView(productImage: clothingItem.imageName, productName: clothingItem.name, productPrice: clothingItem.price)) {
                            ClothCard(width: 160, height: 150, clothingItem: clothingItem)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}


struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    @State private var isTabBarHidden: Bool = false
    @State var selectedTab: Int = 100


    @ViewBuilder
    var tabViews: some View {

        NavigationStack {
            HomeView()
        }
        .tabItem {
            Image(systemName: "house")
        }
        .tag(1)

        NavigationStack {
            ScannerView()
        }
        .tabItem {
            Image(systemName: "qrcode")
        }
        .tag(2)

        ReelView()
        .tabItem {
            Image(systemName: "movieclapper")
        }
        .tag(0)



        NavigationStack {
            MapView()
        }
        .tabItem {
            Image(systemName: "mappin.circle.fill")
        }
        .tag(3)

        NavigationStack {
            ProfileView()
        }
        .tabItem {
            Image(systemName: "person")
        }
        .tag(4)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            tabViews
                .tint(nil)
                .toolbarBackground(selectedTab == 0 ? .black : .white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(selectedTab == 0 ? .white : Color(hex: "#2C4C52"))

    }
}

#Preview {
    MainView()
}


struct ButtonDestination {
    var destination: AnyView
}

struct SliderView: View {
    let buttonDestinations: [ButtonDestination] = [
        ButtonDestination(destination: AnyView(aboutPatagoniaBrandView())),
        ButtonDestination(destination: AnyView(aboutArcteryxBrandView(isTabBarHidden: .constant(true)))),
        ButtonDestination(destination: AnyView(ScannerView())),

    ]
    let images = ["Patagonia", "Arcteryx", "brokenplanet"]
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
            Text("Hey Parsa!")
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
                NavigationLink(destination: GenTopsView()) {
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
        NavigationStack {
            VStack {
                ForEach(1..<5) { index in
                    NavigationLink(destination: destinationView(for: index)) {
                        BrandImageCardView(brandCard: Image("meow_\(index)"), height: (index == 2 || index == 3) ? 150 : 110)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func destinationView(for index: Int) -> some View {
        switch index {
        case 1:
            GenAccessoriesView()
                .navigationTitle("Accessories")
        case 2:
            GenTopsView()
                .navigationTitle("T-Shirts")
        case 3:
            GenBottomsView()
                .navigationTitle("Pants")
        case 4:
            GenShoesView()
                .navigationTitle("Shoes")
        default:
            Text("Default View")
        }
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
        Text("reThread knows what you love, so you can stay sustianable while still looking great.")
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .font(.largeTitle)

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
    let clothingItem: ClothingItem
    var body: some View {
        VStack (alignment: .leading) {
            WebImage(url: URL(string: clothingItem.imageName))
                .resizable()
                .frame(width: width, height: height)
//                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(clothingItem.name)
                .font(.subheadline)
            Text("$\(clothingItem.price)")
                .font(.subheadline)
                .padding(.bottom, 20)
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
            Text("Active Wear")
                .font(.subheadline)
            HStack {
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
            Text("Because You Love the Outdoors")
                .multilineTextAlignment(.center)
                .font(.title)


            NavigationStack {
                NavigationLink(destination: GenTopsView()) {
                    Text("View All")
                        .font(.title2)
                        .foregroundStyle(.red)
                }
            }


        }
        .padding()
        .border(Color(hex: "#2C4C52"), width: 4)
    }
}

struct CustomBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left") // Replace with your custom image
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(hex: "#2C4C52")) // Customize as needed
        }
    }
}
