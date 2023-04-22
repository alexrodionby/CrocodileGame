import Foundation

struct CategoryModel {
    var categories = Topics.categories
    
    func fetchWords(at index: Int, count: Int) -> [String] {
        let words = Bundle.main.decode(WordsRespondse.self, from: categories[index].fileName).words.shuffled()
        return Array(words.prefix(count))
    }
}
