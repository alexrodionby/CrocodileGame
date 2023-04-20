import Foundation

final class GameStore {
    static let shared = GameStore()
    private init() {}
    
    var teams = [Team(name: "Ковбои", image: "cowboy"),
                 Team(name: "Стройняшки", image: "burger")]
    var topics = [Category(name: "Животные", image: "🐸"),
                  Category(name: "Еда", image: "🍔"),
                  Category(name: "Личности", image: "🤠"),
                  Category(name: "Хобби", image: "💅")]
}

