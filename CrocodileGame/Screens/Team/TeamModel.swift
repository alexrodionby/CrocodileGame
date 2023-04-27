import Foundation

struct TeamModel {
    let allImages = ["animal", "burger", "cowboy", "hobby"]
    var allNames = [
        "Шарик в кеглю",
        "Волшебные Волшебники",
        "Спецотряд \"Ромашка\"",
        "Бешеные огурцы",
        "Вам и не снилось",
        "Короткое замыкание",
        "Они убили Кенни",
        "Немного Мозга",
        "27 999 белок",
        "Пластилин колец",
        "Селедка под шубой",
        "Не палимся",
        "Саперы-хороводоводы",
        "Немножко божественные",
        "Жертвы фотошопа",
        "Что хотим то и играем",
        "Рождённые лежать",
        "Зрящие во все корни",
        "Расчеши манту",
        "Чуть выше плинтуса",
        "Свирепые ёжики",
        "Свинки в космосе",
        "Святые негодники",
        "Без названия",
        "Пламенные единорожки",
        "Неадекватные люди",
        "Иногда мы смелые",
        "Пчелы против мёда",
        "Фонд озеленения Луны",
        "Скучная команда",
        "Ниндзи умирают стоя",
        "Мы не в теме",
        "С потолка",
        "Ёжики в тумане",
        "Так и поплывём",
        "Потом придумаем",
        "На дне",
        "Ожиревшие партизаны",
        "Ботаники на Титанике",
        "Исключение из правил",
        "Колботрясы",
        "Грачи налетели",
        "Внуки Джеки Чана",
        "Потому что гладиолус",
        "Сдаём квартиру",
        "Хомяки на пределе",
        "Неестественный отбор",
        "Вино из неудачников",
        "Кого смогли того собрали",
        "Пирожок с вермишелью",
        "Вот эти ребята",
        "Мы по блату",
        "Ветераны космических войск",
        "Мозгов.net",
        "Дети йети",
        "Команда",
        "Придется подумать",
        "Осьминоги гриль",
        "Моржи сердцееды",
        "Яростный пони",
        "Помидорчики",
        "Ленивый чемпионы",
        "Кто все эти люди",
        "Ходим конем",
        "Что попало",
        "Прозрачные гонщики",
        "Загугленное поколение"
        ]
    
    var newTeams = [
    "Член"
    
    ]
    
    
    var currentTeams = [Team]()
 
    
    func randomTeams(count: Int) -> [Team] {
        var names = allNames
        var images = allImages
        guard count < allNames.count, count < allImages.count else { return [] }
        var result: [Team] = []
        for _ in 0..<count {
            let name = names.remove(at: Int.random(in: 0..<names.count))
            let image = images.remove(at: Int.random(in: 0..<images.count))
            result.append(Team(name: name, image: image))
        }
        return result
    }
    
    
    
    func addNewTeam (count: Int) -> [Team] {
        var names = newTeamCrodile
        var images = allImages
        guard count < allNames.count, count < allImages.count else { return [] }
        var result: [Team] = []
        for _ in 0..<count {
          
            let image = images.remove(at: Int.random(in: 0..<images.count))
            result.append(Team(name: names, image: image))
            
        }
        return result
    }
}
