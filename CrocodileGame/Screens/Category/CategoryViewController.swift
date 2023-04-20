import UIKit

class CategoryViewController: BaseController {
    var categories = GameStore.shared.categories
    
    lazy var stack = UIStackView()
    
    let startGameButton = UIButton(type: .system)

    override func setupViews() {
        super.setupViews()
        setupBeginGameButton()
        setupStack()
        title = "Категории"
        addNavBarButton(at: .left, with: "Назад")

    }
    
    private func setupStack() {
        view.addSubview(stack)
        categories.forEach {
            stack.addArrangedSubview(CategoryView(category: $0))
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 28
        stack.axis = .vertical
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor,
                                       multiplier: 1),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                                           multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 2)
        ])
    }
    
    // Кнопка "Начать игру"
    private func setupBeginGameButton() {
        view.addSubview(startGameButton)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.configure(with: .green, title: "Начать игру", height: 63)
        startGameButton.addTarget(self, action: #selector(playersReadyButtonHandler), for: .primaryActionTriggered)
        
        let playersReadyButtonConstraints: [NSLayoutConstraint] = [
            startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14)
        ]
        
        NSLayoutConstraint.activate(playersReadyButtonConstraints)
    }
    
    @objc
    private func didSelectCommand() {
        print("Выбрали команду")
    }
    
    
    @objc
    private func playersReadyButtonHandler() {
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
