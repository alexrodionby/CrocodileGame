//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class TeamViewController: UIViewController {
    let backgroundImageView = UIImageView(image: UIImage(named: "background"))
    let titleLabel = UILabel()
    let firstTeamButton = UIButton()
    let secondTeamButton = UIButton()
    let playersReadyButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTitleLabel()
        setupPlayersReadyButton()
        setupFirstTeamButton()
        setupSecondTeamButton()
        
    }
    
    // Фон
    private func setupBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundImageViewConstraints: [NSLayoutConstraint] = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
    }
    
    
    // Лейбл
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Кто играет?"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 34)
//        titleLabel.font = UIFont(name: "Changa", size: 34)
        
        
        
        let titleLabelConstraints: [NSLayoutConstraint] = [
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    
    // Лейбл=кнопка "Первая команда"
    private func setupFirstTeamButton() {
        view.addSubview(firstTeamButton)
        firstTeamButton.translatesAutoresizingMaskIntoConstraints = false
        firstTeamButton.backgroundColor = .white
        firstTeamButton.layer.cornerRadius = 5
        firstTeamButton.setTitleColor(.black, for: .normal)
        firstTeamButton.setTitle("Команда 1", for: .normal)
        let image = UIImage(named: "Icon1")
        firstTeamButton.setImage(image, for: .normal)
        
        
        let firstTeamLabelConstraints: [NSLayoutConstraint] = [
            firstTeamButton.heightAnchor.constraint(equalToConstant: 96),
            firstTeamButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            firstTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            firstTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(firstTeamLabelConstraints)
    }
    
    // Лейбл=кнопка "Вторая команда"
    private func setupSecondTeamButton() {
        view.addSubview(secondTeamButton)
        secondTeamButton.translatesAutoresizingMaskIntoConstraints = false
        secondTeamButton.backgroundColor = .white
        secondTeamButton.layer.cornerRadius = 5
        secondTeamButton.setTitleColor(.black, for: .normal)
        secondTeamButton.setTitle("Команда 2", for: .normal)
        let image = UIImage(named: "Icon2")
        secondTeamButton.setImage(image, for: .normal)
        
        
        let secondTeamLabelConstraints: [NSLayoutConstraint] = [
            secondTeamButton.heightAnchor.constraint(equalToConstant: 96),
            secondTeamButton.topAnchor.constraint(equalTo: firstTeamButton.bottomAnchor, constant: 28),
            secondTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            secondTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(secondTeamLabelConstraints)
    }
    
    
    
    
    // Кнопка "Игроки готовы"
    private func setupPlayersReadyButton() {
        view.addSubview(playersReadyButton)
        playersReadyButton.translatesAutoresizingMaskIntoConstraints = false
        playersReadyButton.configure(with: .green, title: "Игроки готовы", height: 63)
        playersReadyButton.addTarget(self, action: #selector(playersReadyButtonHandler), for: .primaryActionTriggered)
        
        let playersReadyButtonConstraints: [NSLayoutConstraint] = [
            playersReadyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14)
        ]
        
        NSLayoutConstraint.activate(playersReadyButtonConstraints)
    }
    
    @objc
    private func playersReadyButtonHandler() {
        print("Нажали кнопку Игроки готовы")
    }
    
}
