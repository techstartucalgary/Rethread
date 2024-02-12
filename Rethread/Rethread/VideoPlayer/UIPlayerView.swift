import UIKit
import AVFoundation

class UIVideoPlayer: UIView {
    
    private var playerLayer = AVPlayerLayer()
    private var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVideoPlayer()
        addAppLifecycleObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVideoPlayer() {
        guard let url = URL(string: "https://github.com/bbmvicomte/videoOnboardingScreen/blob/master/bounce.mp4?raw=true") else { return }
        
        player = AVPlayer(url: url)
        player?.isMuted = true
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
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
    
    @objc private func playerItemDidReachEnd(notification: Notification) {
        player?.seek(to: CMTime.zero)
        player?.play()
    }
    
    private func addAppLifecycleObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc private func appDidBecomeActive() {
        player?.play()
    }
    
    @objc private func appWillResignActive() {
        player?.pause()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
