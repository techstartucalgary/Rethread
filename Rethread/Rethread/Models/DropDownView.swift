import SwiftUI

struct ContentViewDrop: View {
    @State private var selection: String?
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                DropDownView(
                    selection: $selection,
                    hint: "Select",
                    options: ["Option 1", "Option 2", "Option 3"],
                    anchor: .bottom
                )
            }
        }
    }
}

struct DropDownView: View {
    @Binding var selection: String?
    var hint: String
    var options: [String]
    var anchor: Alignment = .bottom
    var maxWidth: CGFloat = 130
    var cornerRadius: CGFloat = 9

    @State private var showOptions: Bool = false
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State private var zIndex: Double = 2000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size

            VStack(spacing: 0) {
                if showOptions && anchor == .top {
                    OptionsView()
                }
                HStack(spacing: 0) {
                    Text(selection ?? hint)
                        .foregroundStyle(selection == nil ? .gray : Color.primaryTextColor)
                        .lineLimit(1)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.title3)
                        .foregroundStyle(Color.primaryColor)
                        .rotationEffect(.init(degrees: showOptions ? -90 : 0))
                        
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.height)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(Color.white)
                        .cornerRadius(10)
                )
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zIndex = index
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                .zIndex(10)
                if showOptions && anchor == .bottom {
                    OptionsView()
                }
                
            }
            .clipped()
            .contentShape(.rect)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.gray, lineWidth: 1)
                    .background(Color.white)
                    .cornerRadius(cornerRadius)
            )
            .frame(height: size.height, alignment: anchor == .top ? .bottom : .top)
    
        }
        .frame(width: maxWidth, height: 57)
        .zIndex(1000)
    }
    @ViewBuilder
    func OptionsView() -> some View {
        VStack(spacing: 10) {
            ForEach(options, id: \.self) { option in
                HStack(spacing: 0){
                    Text(option)
                        .lineLimit(1)

                    Spacer(minLength: 0)

                    Image(systemName: "checkmark")
                        .font(.caption)
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.primaryTextColor : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showOptions = false
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .transition(.move(edge: anchor == .top ? .bottom : .top))
    }
    

    enum Anchor {
        case top
        case bottom
    }
}

#Preview {
    ContentViewDrop()
}
