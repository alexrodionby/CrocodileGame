//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class CategoryViewController: UIViewController {
    let backgroundImageView = UIImageView(image: UIImage(named: "background"))
    let titleLabel = UILabel()
    let firstCategoryButton = UIButton()
    let secondCategoryButton = UIButton()
    let thirdCategoryButton = UIButton()
    let fourthCategoryButton = UIButton()
    let startGameButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTitleLabel()
        setupBeginGameButton()
        setupFirstCategoryButton()
        setupSecondCategoryButton()
        setupThirdCategoryButton()
//        setupFourthCategoryButton()
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
    private func setupFirstCategoryButton() {
        view.addSubview(firstCategoryButton)
        firstCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        firstCategoryButton.backgroundColor = .white
        firstCategoryButton.layer.cornerRadius = 5
        firstCategoryButton.setTitleColor(.black, for: .normal)
        firstCategoryButton.setTitle("Личности", for: .normal)
        let image = UIImage(named: "Icon1")
        firstCategoryButton.setImage(image, for: .normal)
        firstCategoryButton.addTarget(self, action: #selector(didSelectCommand), for: .primaryActionTriggered)
        
        
        let constraints: [NSLayoutConstraint] = [
            firstCategoryButton.heightAnchor.constraint(equalToConstant: 96),
            firstCategoryButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            firstCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            firstCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupSecondCategoryButton() {
        view.addSubview(secondCategoryButton)
        secondCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        secondCategoryButton.backgroundColor = .white
        secondCategoryButton.layer.cornerRadius = 5
        secondCategoryButton.setTitleColor(.black, for: .normal)
        secondCategoryButton.setTitle("Еда", for: .normal)
        let image = UIImage(named: "Icon2")
        secondCategoryButton.setImage(image, for: .normal)
        secondCategoryButton.addTarget(self, action: #selector(didSelectCommand), for: .primaryActionTriggered)
        
        
        let constraints: [NSLayoutConstraint] = [
            secondCategoryButton.heightAnchor.constraint(equalToConstant: 96),
            secondCategoryButton.topAnchor.constraint(equalTo: firstCategoryButton.bottomAnchor, constant: 25),
            secondCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            secondCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupThirdCategoryButton() {
        view.addSubview(thirdCategoryButton)
        thirdCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        thirdCategoryButton.backgroundColor = .white
        thirdCategoryButton.layer.cornerRadius = 5
        thirdCategoryButton.setTitleColor(.black, for: .normal)
        thirdCategoryButton.setTitle("Хобби", for: .normal)
        let image = UIImage(named: "Icon3")
        thirdCategoryButton.setImage(image, for: .normal)
        thirdCategoryButton.addTarget(self, action: #selector(didSelectCommand), for: .primaryActionTriggered)
        
        
        let constraints: [NSLayoutConstraint] = [
            thirdCategoryButton.heightAnchor.constraint(equalToConstant: 96),
            thirdCategoryButton.topAnchor.constraint(equalTo: secondCategoryButton.bottomAnchor, constant: 25),
            thirdCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            thirdCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
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
        print("Нажали кнопку Начать игру")
    }
    
}
