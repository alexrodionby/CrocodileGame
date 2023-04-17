import UIKit

class GameViewController: BaseController {
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let timerLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let rightButton = UIButton(type: .system)
    private let wrongButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)
    private lazy var buttonStack = UIStackView(arrangedSubviews: [rightButton, wrongButton, skipButton])
}

extension GameViewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(logoImageView)
        view.addSubview(timerLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonStack)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 57),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            titleLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -1),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            descriptionLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -1),
            
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: 12),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: buttonStack.bottomAnchor, multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        timerLabel.text = "00:59"
        timerLabel.font = .italicSystemFont(ofSize: 48)
        
        titleLabel.text = "Картошка"
        titleLabel.textAlignment = .center
        titleLabel.font = .italicSystemFont(ofSize: 48)
        
        descriptionLabel.text = "объясни с помощью жестов"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .italicSystemFont(ofSize: 20)
        rightButton.configure(with: .green, title: "Правильно")
        wrongButton.configure(with: .red, title: "Нарушил правила")
        skipButton.configure(with: .gray, title: "Сбросить")
        
        buttonStack.axis = .vertical
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 11
    }
}
