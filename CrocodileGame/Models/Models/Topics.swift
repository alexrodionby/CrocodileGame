import Foundation

enum Topics: String, CaseIterable {
    case easy
    case hardcore
    case newyear
    case normal
    case phraseological
    case summer
    case quick
    
    var fileName: String {
        switch self {
        case .easy: return "EasyWords.json"
        case .hardcore: return "Hardcore.json"
        case .newyear: return "NewYear.json"
        case .normal: return "Normal.json"
        case .phraseological: return "Phraselogical.json"
        case .summer: return "Summer.json"
        case .quick: return "QuickGame.json"
        }
    }
    
    var name: String {
        switch self {
        case .easy: return "Базовый Алиас"
        case .hardcore: return "Хардкор"
        case .newyear: return "Новогодний Алиас"
        case .normal: return "Для уверенных игроков"
        case .phraseological: return "Крылатыe фразы и фразеологизмы"
        case .summer: return "Летний отпуск"
        case .quick: return "Быстрая игра"
        }
    }
    
    var color: String {
        "\(self.rawValue)Color"
    }
    
    var image: String {
        "burger"
    }
    
    static var categories: [Category] {
        Self.allCases.map { Category(name: $0.name, image: $0.image, color: $0.color, fileName: $0.fileName)}
    }
}
