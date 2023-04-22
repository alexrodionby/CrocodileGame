import Foundation



struct WordsRespondse: Codable {
    let words: [String]
}

struct CrocodileBrain {
    var words: [String]
    var teams: [Team]
    var currentTeam = 0
    var currentRound = 0
    func getTitle() -> String {
        words.first ?? "Конец игры"
    }
    
    var gameOver: Bool {
        words.isEmpty || currentRound == 1
    }
    
    func getDescription() -> String {
        let results = [
            "Объясни с помощью слов.",
            "Объясни с помощью жестов.",
            "Объясни с помощью рисунка.",
            "Объясняй со злостью.",
            "Объясняй с помощью мимики.",
            "Объясняй вульгарно.",
            "Объясняй сексуально."
        ]
        return results.randomElement() ?? results[0]
    }
    
    func getCurrentTeam() -> Team {
        teams[currentTeam]
    }
    
    mutating func correctAnswer() {
        teams[currentTeam].score += 1
    }
    
    mutating func nextTeam() {
        words.removeFirst()
        currentTeam += 1
        if currentTeam == teams.count {
            currentTeam = 0
            currentRound += 1
        }
    }
}
