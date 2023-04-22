import Foundation

extension UserDefaults {
    private enum Keys: String {
        case scores
    }
    
    var crocodileScores: [Team] {
        get {
            if let data = UserDefaults.standard.value(forKey: Keys.scores.rawValue) as? Data {
                let decoder = JSONDecoder()
                return (try? decoder.decode([Team].self, from: data)) ?? []
            } else {
                return []
            }
        }
        set {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(newValue) {
                UserDefaults.standard.set(data, forKey: Keys.scores.rawValue)
            }
        }
    }
}
