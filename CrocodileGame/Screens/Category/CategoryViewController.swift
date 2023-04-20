//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class CategoryViewController: UIViewController {
    
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
    
    private lazy var firstCategoryView: UIView = {
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
        label.text = "Личности"
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
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    
    let startGameButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTitleLabel()
        setupBeginGameButton()
        setupFirstCategoryView()
        
    }
    
    // Фон
    private func setupBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Категории"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 34)
//        titleLabel.font = UIFont(name: "Changa", size: 34)
        
        
        
        let constraints: [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 42),
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // Лейбл=кнопка "Первая категория"
    private func setupFirstCategoryView() {
        view.addSubview(firstCategoryView)
    
        firstCategoryView.backgroundColor = .lightGray
        firstCategoryView.addSubview(firstComandNameLabel)
        firstCategoryView.addSubview(firstTeamCircleImageView)
        firstTeamCircleImageView.addSubview(firstTeamEmogyLabel)
        firstCategoryView.addSubview(checkMark)
        
        let constraints: [NSLayoutConstraint] = [
            firstCategoryView.heightAnchor.constraint(equalToConstant: 96),
            firstCategoryView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            firstCategoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            firstCategoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            firstComandNameLabel.centerXAnchor.constraint(equalTo: firstCategoryView.centerXAnchor),
            firstComandNameLabel.centerYAnchor.constraint(equalTo: firstCategoryView.centerYAnchor),
            
            firstTeamCircleImageView.widthAnchor.constraint(equalToConstant: 56),
            firstTeamCircleImageView.heightAnchor.constraint(equalToConstant: 56),
            firstTeamCircleImageView.centerYAnchor.constraint(equalTo: firstCategoryView.centerYAnchor),
            firstTeamCircleImageView.leadingAnchor.constraint(equalTo: firstCategoryView.leadingAnchor, constant: 17),
            
            firstTeamEmogyLabel.centerYAnchor.constraint(equalTo: firstTeamCircleImageView.centerYAnchor),
            firstTeamEmogyLabel.centerXAnchor.constraint(equalTo: firstTeamCircleImageView.centerXAnchor),
            
            checkMark.widthAnchor.constraint(equalToConstant: 30),
            checkMark.heightAnchor.constraint(equalToConstant: 30),
            checkMark.centerYAnchor.constraint(equalTo: firstCategoryView.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: firstCategoryView.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
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
