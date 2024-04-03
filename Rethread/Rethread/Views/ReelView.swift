//
//  ReelView.swift
//  InstReels
//

//

import SwiftUI
import AVKit

enum SideButton: CaseIterable {
    case like, menu
    
    var image: Image {
        switch self {
        case .like: Image(systemName: "suit.heart")
        case .menu: Image(systemName: "ellipsis")
        }
    }
    
}

struct ReelView: View {
    @State private var selectedStyle: VideoType? = nil


    var body: some View {
        GeometryReader { proxy in
            
            let size = proxy.size
            
            TabView {
                ForEach(fetchVideos().filter { video in

                    return selectedStyle == .all || selectedStyle == nil || video.mediaFile.vidType == selectedStyle
                })
                { reel in
                   ReelPlayer(reel: reel)
                    .frame(width: size.width)
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)

                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
            .overlay(
                Menu {

                    Button("All") {
                        selectedStyle = .all
                    }
                    
                    ForEach(VideoType.allCases.filter { $0 != .all }, id: \.self) { type in
                           Button(action: {
                               selectedStyle = type
                           }) {
                               Text(type.rawValue)
                                   .font(.title)
                                   .fontWeight(.bold)
                           }
                       }
                   } label: {
                       HStack() {
                           Text(selectedStyle == .all ? "Styles" : selectedStyle?.rawValue ?? "Styles")
                               .font(.title)
                               .fontWeight(.heavy)
                               .foregroundColor(.white)
                               .padding(.leading,20)
                           Image(systemName: "chevron.down")
                               .foregroundStyle(.white)
                               .padding(.leading,-6)
                       }
                   },
                   alignment: .topLeading
                    )

        }
        .ignoresSafeArea(.all, edges: .top)

    }
    
    private func fetchVideos() -> [Reel] {
        Media.previews.map { item -> Reel in
            let url = Bundle.main.path(forResource: item.url, ofType: "MP4") ?? Bundle.main.path(forResource: item.url, ofType: "mp4") ?? Bundle.main.path(forResource: item.url, ofType: "MOV") ?? Bundle.main.path(forResource: item.url, ofType: "mov") ?? ""

            let player = AVPlayer(url: URL(fileURLWithPath: url))
            return Reel(player: player, mediaFile: item)
        }
    }
}

#Preview {
    FullVidView()
}

struct ReelPlayer: View {
    let reel: Reel
    
    @State var readMore = false
    var description = " Shall I compare thee to a summer’s day? Thou art more lovely and more temperate: Rough winds do shake the darling buds of May, And summer’s lease hath all too short a date"

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            


            VideoPlayer(player: reel.player)
                .onAppear {
                    reel.player.seek(to: CMTime.zero)
                    reel.player.play()
                }
                .onDisappear {
                    reel.player.pause()
                }
        
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    HStack(alignment: .bottom) {
                        Image("king")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)

                                Text("Parsa_king420")
                                    .font(.system(size: 16))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 10)
                        
                        Button(action: {
                            //
                        }, label: {
                            Text("Follow")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.white.opacity(0.7), lineWidth: 1)
                                }
                            
                        })
                        .padding(.bottom, 6)
                        
                            }
                            
                            ZStack(alignment: .bottomLeading) {
                                if readMore {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        Text(reel.mediaFile.title + description)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .frame(width: 300, height: 64)
                                } else {
                                    
                                    Button(action: {
                                        withAnimation { readMore.toggle() }
                                    }, label: {
                                        HStack {
                                            Text(reel.mediaFile.title)
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.white)
                                                .lineLimit(1)
                                            
                                            Text("more")
                                                .font(.callout)
                                                .bold()
                                                .foregroundStyle(Color(uiColor: .systemGray2))
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    })
                                   
                                }

                            }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
         
            
            VStack(spacing: 20) {
                ForEach(SideButton.allCases, id: \.self) { button in
                    makeSideButton(for: button, accessoryNumber: button == .menu || button == .menu ? 0 : (0...300).randomElement()!)
                }
            }
            .padding()
            
        

        }
    }
}

extension ReelPlayer {
    private func makeSideButton(for button: SideButton, accessoryNumber: Int) -> some View {
        Button(action: {
            //
        }, label: {
            VStack(spacing: 0) {
                button.image
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(1)
                
                if accessoryNumber > 0 {
                    Text(String(accessoryNumber))
                        .font(.caption)
                        .foregroundStyle(.white)
                        .bold()
                }
                
            }
        })
    }
}


