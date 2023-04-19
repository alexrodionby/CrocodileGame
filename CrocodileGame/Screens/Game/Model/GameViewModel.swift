import Foundation
import AVFoundation

protocol GameViewModelProtocol: AnyObject {
    func updateUI(seconds: Int)
}

final class GameViewModel {
    weak var delegate: GameViewModelProtocol?
    var timer: Timer?
    var player: AVAudioPlayer!
    var currentTime = 59
    
    func startTimer() {
        timer?.invalidate()
        currentTime = 59
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    @objc func updateTimer() {
        if currentTime > 0 {
            currentTime -= 1
        } else {
            timer?.invalidate()
            playSound()
        }
        delegate?.updateUI(seconds: currentTime)
    }
}
