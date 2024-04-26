//
//  ReelModel.swift
//  InstReels
//
//

import SwiftUI
import AVKit
import YouTubeiOSPlayerHelper

struct Reel: Identifiable {
    var id = UUID()
    var player: AVPlayer
    var mediaFile: Media
}
