import UIKit
import SwiftUI

class GameViewController: BaseController, CorrectAnswerProtocol {
    private var brain: CrocodileBrain
    
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
    
    init(brain: CrocodileBrain) {
            self.brain = brain
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    func start() {
        if brain.gameOver {
            saveScore()
            let controller = GameResultViewController(teams: brain.teams)
            navigationController?.pushViewController(controller, animated: true)
        } else {
            viewModel.startTimer()
            titleLabel.text = brain.getTitle()
            descriptionLabel.text = brain.getDescription()
        }
    }
    
    private func stop() {
        titleLabel.text = ""
        descriptionLabel.text = ""
        viewModel.stopTimer()
    }
    
    func saveScore() {
        var scores = UserDefaults.standard.crocodileScores
        scores.append(contentsOf: brain.teams)
        UserDefaults.standard.crocodileScores = scores
    }
    
    @objc func rightButtonHandler() {
        stop()
        brain.correctAnswer()
        let team = brain.getCurrentTeam()
        brain.nextTeam()
        let controller = CorrectViewController(team: team)
        controller.configure(with: team,
                             answer: true,
                             next: brain.getCurrentTeam().name)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func wrongButtonHandler() {
        stop()
        let team = brain.getCurrentTeam()
        brain.nextTeam()
        let controller = CorrectViewController(team: team)
        controller.configure(with: team,
                             answer: false,
                             next: brain.getCurrentTeam().name)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func skipButtonHandler() {
        let skipAction = UIAlertAction(title: "Да",
                                       style: .destructive) { _ in
            self.saveScore()
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
