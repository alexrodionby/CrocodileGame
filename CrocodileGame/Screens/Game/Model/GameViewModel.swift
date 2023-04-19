import Foundation
import AVFoundation

protocol GameViewModelProtocol: AnyObject {
    func updateUI(seconds: Int)
}

final class GameViewModel {
    weak var delegate: GameViewModelProtocol?
    var timer: Timer?
    var player: AVAudioPlayer!
    var totalTime = 59
    var secondsPassed = 0
    
    func startTimer() {
        timer?.invalidate()
        secondsPassed = 0
        totalTime = 59
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            delegate?.updateUI(seconds: totalTime - secondsPassed)
        } else {
            timer?.invalidate()
            delegate?.updateUI(seconds: 0)
            playSound()
        }
    }
}
