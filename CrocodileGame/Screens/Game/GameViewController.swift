import UIKit

class GameViewController: BaseController {
    private let rightButton = UIButton(type: .system)
    private let wrongButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)
    private lazy var buttonStack = UIStackView(arrangedSubviews: [rightButton, wrongButton, skipButton])
}

extension GameViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: 12),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: buttonStack.bottomAnchor, multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        rightButton.configure(with: .green, title: "Правильно")
        wrongButton.configure(with: .red, title: "Нарушил правила")
        skipButton.configure(with: .gray, title: "Сбросить")
        buttonStack.axis = .vertical
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 11
    }
}
