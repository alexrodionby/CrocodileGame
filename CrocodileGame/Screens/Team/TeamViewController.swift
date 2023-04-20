//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class TeamViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Кто играет?"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 34)
        return label
    }()
    
    private lazy var firstTeamView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var firstComandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Bhavuka", size: 22)
        label.text = "Ковбои"
        return label
    }()
    
    private lazy var firstTeamCircleImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bounds.size = CGSize(width: 56, height: 56)
        view.layer.cornerRadius = view.frame.size.width / 2
        view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var firstTeamEmogyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🤠"
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private lazy var checkMark: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "checkmark.circle.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let playersReadyButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTitleLabel()
        setupFirstTeamView()
        setupPlayersReadyButton()
        
    }
    
    // Фон
    private func setupBackground() {
        view.addSubview(backgroundImageView)
        
        let constraints: [NSLayoutConstraint] = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // Лейбл
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        let constraints: [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // Вью "Первая команда"
    private func setupFirstTeamView() {
        view.addSubview(firstTeamView)
        firstTeamView.addSubview(firstComandNameLabel)
        firstTeamView.addSubview(firstTeamCircleImageView)
        firstTeamCircleImageView.addSubview(firstTeamEmogyLabel)
        firstTeamView.addSubview(checkMark)
        
        let constraints: [NSLayoutConstraint] = [
            firstTeamView.heightAnchor.constraint(equalToConstant: 96),
            firstTeamView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            firstTeamView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            firstTeamView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            firstComandNameLabel.centerXAnchor.constraint(equalTo: firstTeamView.centerXAnchor),
            firstComandNameLabel.centerYAnchor.constraint(equalTo: firstTeamView.centerYAnchor),
            
            firstTeamCircleImageView.widthAnchor.constraint(equalToConstant: 56),
            firstTeamCircleImageView.heightAnchor.constraint(equalToConstant: 56),
            firstTeamCircleImageView.centerYAnchor.constraint(equalTo: firstTeamView.centerYAnchor),
            firstTeamCircleImageView.leadingAnchor.constraint(equalTo: firstTeamView.leadingAnchor, constant: 17),
            
            firstTeamEmogyLabel.centerYAnchor.constraint(equalTo: firstTeamCircleImageView.centerYAnchor),
            firstTeamEmogyLabel.centerXAnchor.constraint(equalTo: firstTeamCircleImageView.centerXAnchor),
            
            checkMark.widthAnchor.constraint(equalToConstant: 30),
            checkMark.heightAnchor.constraint(equalToConstant: 30),
            checkMark.centerYAnchor.constraint(equalTo: firstTeamView.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: firstTeamView.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
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
        let controller = CategoryViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
