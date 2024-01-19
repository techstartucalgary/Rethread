import Foundation
import SwiftUI
import AVKit

class UIVideoPlayer: UIView {
    
    private var playerLayer = AVPlayerLayer()
    private var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let url = URL(string: "https://github.com/bbmvicomte/videoOnboardingScreen/blob/master/bounce.mp4?raw=true") else { return }
        
        player = AVPlayer(url: url)
        player?.isMuted = true
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        
        layer.addSublayer(playerLayer)

        // Add observer
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
        
        player?.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        // Restart video from the beginning
        player?.seek(to: CMTime.zero)
        player?.play()
    }
    
    deinit {
        // Remove observer
        NotificationCenter.default.removeObserver(self)
    }
}
