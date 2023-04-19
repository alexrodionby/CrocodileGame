import UIKit

class GameViewController: BaseController {
    private var brain = CrocodileBrain()
    private let viewModel = GameViewModel()
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let timerLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private lazy var titleStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
    private let rightButton = UIButton(type: .system)
    private let wrongButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)
    private lazy var buttonStack = UIStackView(
        arrangedSubviews: [rightButton, wrongButton, skipButton])
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.start()
        }
    }
    
    private func start() {
        viewModel.startTimer()
        titleLabel.text = brain.getTitle()
        descriptionLabel.text = brain.getDescription()
    }
    
    private func stop() {
        viewModel.stopTimer()
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
}
// MARK: Setup
extension GameViewController {
    override func setupViews() {
        super.setupViews()
        setupLogoImage()
        setupTimerLabel()
        setupTitleLabel()
        setupDescriptionLabel()
        setupTitleStack()
        setupRightButton()
        setupWrongButton()
        setupSkipButton()
        setupButtonStack()
        viewModel.delegate = self
    }
    
    private func setupLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupTimerLabel() {
        view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = .italicSystemFont(ofSize: 48)
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = .italicSystemFont(ofSize: 48)
    }
    
    private func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .italicSystemFont(ofSize: 20)
    }
    
    private func setupTitleStack() {
        view.addSubview(titleStack)
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.axis = .vertical
        NSLayoutConstraint.activate([
            titleStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
            titleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11)
        ])
    }
    
    private func setupRightButton() {
        rightButton.configure(with: .green, title: "Правильно")
        rightButton.addTarget(self, action: #selector(rightButtonHandler),
                              for: .primaryActionTriggered)
    }
    
    private func setupWrongButton() {
        wrongButton.configure(with: .red, title: "Нарушил правила")
        wrongButton.addTarget(self, action: #selector(wrongButtonHandler),
                              for: .primaryActionTriggered)
    }
    
    private func setupSkipButton() {
        skipButton.configure(with: .gray, title: "Сбросить")
        skipButton.addTarget(self, action: #selector(skipButtonHandler),
                             for: .primaryActionTriggered)
    }
    
    private func setupButtonStack() {
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .vertical
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 11
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: 12),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow:
                                                                buttonStack.bottomAnchor, multiplier: 1)
        ])
    }
    
    @objc func rightButtonHandler() {
        stop()
        let controller = CorrectViewController()
        controller.view.backgroundColor = UIColor(named: "greenButton")
        present(controller, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            controller.dismiss(animated: true)
            self.start()
        }
    }
    
    @objc func wrongButtonHandler() {
        stop()
        let controller = WrongViewController()
        controller.view.backgroundColor = UIColor(named: "redButton")
        present(controller, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            controller.dismiss(animated: true)
            self.start()
        }
    }
    
    @objc func skipButtonHandler() {
        let skipAction = UIAlertAction(title: "Да",
                                       style: .destructive) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }

        let cancelAction = UIAlertAction(title: "Отмена",
                  style: .cancel) { _ in }
             
        let alert = UIAlertController(title: "Сбросить игру?",
                    message: "Вы хотите сбросить вашу игру и вернуться в главное меню?",
                                      preferredStyle: .alert)
        alert.addAction(skipAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}

extension GameViewController: GameViewModelProtocol {
    func updateUI(seconds: Int) {
        timerLabel.text = String(format: "00:%02d", seconds)
    }
}
