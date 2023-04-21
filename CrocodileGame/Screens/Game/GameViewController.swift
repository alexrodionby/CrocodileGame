import UIKit
import SwiftUI

class GameViewController: BaseController {
    private var brain = CrocodileBrain(
        words:  Bundle.main.decode(
            WordsRespondse.self,
            from: UserDefaults.standard.topics).words.shuffled(),
        teams: GameStore.shared.teams)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func start() {
        guard !brain.gameOver else {
            let controller = ResultAllViewController()
            navigationController?.pushViewController(controller, animated: true)
            return
        }
        let goAction = UIAlertAction(title: "Поехали",
                                       style: .default) { _ in
            self.viewModel.startTimer()
            self.titleLabel.text = self.brain.getTitle()
            self.descriptionLabel.text = self.brain.getDescription()
        }
             
        let alert = UIAlertController(title: nil,
                                      message: "Приветствуем команду \(self.brain.getCurrentTeam().name)",
                                      preferredStyle: .alert)
        alert.addAction(goAction)
        self.present(alert, animated: true)
    }
    
    private func stop() {
        titleLabel.text = ""
        descriptionLabel.text = ""
        viewModel.stopTimer()
    }
    
    @objc func rightButtonHandler() {
        stop()
        brain.correctAnswer()
        let team = brain.getCurrentTeam()
        let controller = UIHostingController(rootView: GameView(team: team, correct: true))
        navigationController?.pushViewController(controller, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            controller.navigationController?.popViewController(animated: true)
            self.brain.nextTeam()
            self.start()
        }
    }
    
    @objc func wrongButtonHandler() {
        stop()
        let team = brain.getCurrentTeam()
        let controller = UIHostingController(rootView: GameView(team: team, correct: false))
        navigationController?.pushViewController(controller, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            controller.navigationController?.popViewController(animated: true)
            self.brain.nextTeam()
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

// MARK: Setup
extension GameViewController {
    override func setupViews() {
        super.setupViews()
        UserDefaults.standard.topics = Topics.easy.rawValue
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
        timerLabel.text = "01:00"
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
        titleLabel.numberOfLines = 0
        titleLabel.font = .italicSystemFont(ofSize: 48)
    }
    
    private func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
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
}

extension GameViewController: GameViewModelProtocol {
    func updateUI(seconds: Int) {
        timerLabel.text = String(format: "00:%02d", seconds)
    }
}
