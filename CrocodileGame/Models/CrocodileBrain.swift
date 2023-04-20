import Foundation



struct WordsRespondse: Codable {
    let words: [String]
}

struct CrocodileBrain {
    var words: [String]
    var score = 0
    
    mutating func getTitle() -> String {
        let result = words.isEmpty ? "Конец игры" : words.removeFirst()
        return result
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
    
    mutating func correctAnswer() {
        score += 1
    }
}
