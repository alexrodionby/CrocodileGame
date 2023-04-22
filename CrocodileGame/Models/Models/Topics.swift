import Foundation

enum Topics: String, CaseIterable {
    case animal
    case food
    case person
    case hobby
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
        case .phraseological: return "Phraseological.json"
        case .summer: return "Summer.json"
        case .quick: return "QuickGame.json"
        case .animal: return "Animal.json"
        case .food: return "Food.json"
        case .person: return "Person.json"
        case .hobby: return "Hobby.json"
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
        case .animal: return "Животные"
        case .food: return "Еда"
        case .person: return "Личности"
        case .hobby: return "Хобби"
        }
    }
    
    var color: String {
        "\(self.rawValue)Color"
    }
    
    var image: String {
        "\(self.rawValue)Image"
    }
    
    static var categories: [Category] {
        Self.allCases.map { Category(name: $0.name, image: $0.image, color: $0.color, fileName: $0.fileName)}
    }
}
