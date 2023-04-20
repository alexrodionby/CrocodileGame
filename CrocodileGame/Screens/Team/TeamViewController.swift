import UIKit

class TeamViewController: BaseController {
    var teams = [Team(name: "Ковбои", image: "cowboy"),
                 Team(name: "Стройняшки", image: "burger")]
    
    lazy var stack = UIStackView(arrangedSubviews: [
        TeamView(team: teams[0]),
        TeamView(team: teams[1])
    ])
    
    let playersReadyButton = UIButton(type: .system)
    
    override func setupViews() {
        super.setupViews()
        setupPlayersReadyButton()
        setupStack()
        title = "Кто играет?"
        addNavBarButton(at: .left, with: "Назад")
    }

    // Кнопка "Игроки готовы"
    private func setupPlayersReadyButton() {
        view.addSubview(playersReadyButton)
        playersReadyButton.translatesAutoresizingMaskIntoConstraints = false
        playersReadyButton.configure(with: .green,
                                     title: "Игроки готовы",
                                     height: 63)
        playersReadyButton.addTarget(self, action: #selector(playersReadyButtonHandler),
                                     for: .primaryActionTriggered)
        
        let playersReadyButtonConstraints: [NSLayoutConstraint] = [
            playersReadyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                       constant: -62),
            playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                        constant: 14),
            playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                         constant: -14)
        ]
        
        NSLayoutConstraint.activate(playersReadyButtonConstraints)
    }
    
    private func setupStack() {
        view.addSubview(stack)
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
    
    @objc
    private func playersReadyButtonHandler() {
        let controller = CategoryViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
