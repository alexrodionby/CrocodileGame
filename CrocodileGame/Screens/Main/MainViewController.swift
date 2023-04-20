//
//  MainViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class MainViewController: UIViewController {
    let backgroundImageView = UIImageView(image: UIImage(named: "background"))
    let crocodileImageView = UIImageView(image: UIImage(named: "crocodile"))
    let leftGrassImageView = UIImageView(image: UIImage(named: "grass"))
    let rightGrassImageView = UIImageView(image: UIImage(named: "grass"))
    let startButton = UIButton(type: .system)
    let rulesButton = UIButton(type: .system)
    
    private func setapRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        rulesButton.configure(with: .green, title: "Правила", height: 63)
        rulesButton.addTarget(self, action: #selector(rulesButtonHandler), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 39),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 83),
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -81),
            rulesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    @objc func rulesButtonHandler() {
        let controller = RulesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

    private func setapStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.configure(with: .green, title: "Старт игры", height: 83)
        startButton.addTarget(self, action: #selector(startButtonHandler), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: crocodileImageView.bottomAnchor, constant: 48),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51)
        ])
    }
    @objc func startButtonHandler() {
        UserDefaults.standard.topics = Topics.easy.rawValue
        let controller = TeamViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        
        navigationItem.backButtonTitle = ""
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(crocodileImageView)
        crocodileImageView.translatesAutoresizingMaskIntoConstraints = false
        crocodileImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            crocodileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // crocodileImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 172),
            crocodileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            crocodileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53),
            crocodileImageView.widthAnchor.constraint(equalToConstant: 268),
            crocodileImageView.heightAnchor.constraint(equalToConstant: 322)
        ])
        
        view.addSubview(leftGrassImageView)
        leftGrassImageView.translatesAutoresizingMaskIntoConstraints = false
        leftGrassImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            leftGrassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftGrassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftGrassImageView.widthAnchor.constraint(equalToConstant: 95),
            leftGrassImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(rightGrassImageView)
        rightGrassImageView.translatesAutoresizingMaskIntoConstraints = false
        rightGrassImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            rightGrassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightGrassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rightGrassImageView.widthAnchor.constraint(equalToConstant: 95),
            rightGrassImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        setapStartButton()
        setapRulesButton()
        
    }
    


}
