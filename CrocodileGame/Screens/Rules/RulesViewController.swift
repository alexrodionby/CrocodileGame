import UIKit

class RulesViewController: UIViewController {
        private let scrollView = UIScrollView()
        private let rulesLabel = UILabel()
        private let backgroundImageView = UIImageView(image: UIImage(named: "background"))

        override func viewDidLoad() {
            super.viewDidLoad()
            setupLayout()
            navigationItem.title = "Правила"
            navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.left")
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.circle.fill")
        }
    }

private extension RulesViewController {
    func setupLayout() {
        configureScrollView()
        configureContentView()
        prepareScrollView()
        prepareBackground()
    }
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
    }
    func configureContentView() {
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.numberOfLines = 0
        rulesLabel.font = rulesLabel.font.withSize(23)
        rulesLabel.text = """
   В игру играют командами из двух или более человек.
 
   Задача каждого игрока команды - объяснить слово, которое он видит на экране, следуя условиям, которые дополнительно указаны под загаданным словом.
 
   Чем больше слов отгадала команда, тем больше она заработает баллов. Выигрывает команда, набравшая больше всего баллов.
 
   На отгадывание слова дается одна минута.
 
   При нарушении правил объяснения слова, ход передается следующей команде.
 """
    }
    func prepareScrollView() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(rulesLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            rulesLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rulesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            rulesLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            rulesLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            rulesLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func prepareBackground() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }

}
