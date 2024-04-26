// YoutubePlayerView.swift

import Foundation
import YouTubeiOSPlayerHelper
import SwiftUI

struct YouTubePlayerView: UIViewRepresentable {
    var videoID: String

    func makeUIView(context: Context) -> YTPlayerView {
            let playerView = YTPlayerView()
            let playerVars = [
                "controls": 0,  // 0 means that YouTube player controls will be hidden
                "playsinline": 1,  // 1 means the video plays inline, not in fullscreen by default
                "autohide": 1,  // 1 means the video controls and video title will hide automatically
                "showinfo": 0,  // 0 means YouTube will not display information like the video title before playback
                "modestbranding": 1  // 1 means YouTube will not show the YouTube logo in the control bar
            ]
            playerView.load(withVideoId: videoID, playerVars: playerVars)
            return playerView
        }

    func updateUIView(_ uiView: YTPlayerView, context: Context) {
    }
}
