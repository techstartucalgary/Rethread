//
//  ReelModel.swift
//  InstReels
//
//

import SwiftUI
import AVKit

struct Reel: Identifiable {
    var id = UUID()
    var player: AVPlayer
    var mediaFile: Media
}
