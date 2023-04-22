import Foundation

final class GameStore {
    static let shared = GameStore()
    private init() {}
    
    var teams = [Team(name: "Ковбои", image: "cowboy"),
                 Team(name: "Стройняшки", image: "burger")]
    var categories = [Category(name: "Животные", image: "animal", color: "animalColor", fileName: ""),
                  Category(name: "Еда", image: "burger", color: "foodColor", fileName: ""),
                  Category(name: "Личности", image: "cowboy", color: "personColor", fileName: ""),
                  Category(name: "Хобби", image: "hobby", color: "redButton", fileName: "")]
}

