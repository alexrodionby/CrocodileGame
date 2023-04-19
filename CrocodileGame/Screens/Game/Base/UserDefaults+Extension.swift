import Foundation

extension UserDefaults {
    private enum Keys: String {
        case topics
    }
    
    var topics: String {
        get {
            UserDefaults.standard.string(forKey: Keys.topics.rawValue) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.topics.rawValue)
        }
    }
}
