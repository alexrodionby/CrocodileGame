import Foundation

final class GameStore {
    static let shared = GameStore()
    private init() {}
    
    var teams = [Team(name: "Ковбои", image: "cowboy"),
                 Team(name: "Стройняшки", image: "burger")]
    var categories = [Category(name: "Животные", image: "animal", color: "animalColor"),
                  Category(name: "Еда", image: "burger", color: "foodColor"),
                  Category(name: "Личности", image: "cowboy", color: "personColor"),
                  Category(name: "Хобби", image: "hobby", color: "redButton")]
}

