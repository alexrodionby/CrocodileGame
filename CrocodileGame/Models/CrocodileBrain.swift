import Foundation

enum Topics: String {
    case easy = "EasyWords.json"
    case hardcore = "Hardcore.json"
    case newyear = "NewYear.json"
    case normal = "Normal.json"
    case phraseological = "Phraselogical.json"
    case summer = "Summer.json"
    case quick = "QuickGame.json"
}

struct WordsRespondse: Codable {
    let words: [String]
}

struct CrocodileBrain {
    var words: [String] = Bundle.main.decode(
        WordsRespondse.self,
        from: Topics.easy.rawValue).words.shuffled()
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
}
