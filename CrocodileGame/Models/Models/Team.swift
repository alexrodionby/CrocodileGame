import Foundation

struct Team: Codable {
    let name: String
    let image: String
    var score = 0
    
    var formatScore: String {
        switch score % 10 {
        case 1 where score % 100 != 11:
            return "очко"
        case 2...4 where (score % 100) / 10 != 1:
            return "очка"
        default:
            return "очков"
        }
    }
}
