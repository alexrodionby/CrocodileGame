//
//  WrongViewController.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class WrongViewController: BaseController {
    let team: Team
    lazy var teamView = TeamView()
    let resultView = UIView()
    let scoreImage = UIImageView()
    let congratulationLabel = UILabel()
    let scoreText = UILabel()
    let youGet = UILabel()
    let nextStep = UILabel()
    weak var delegate: CorrectAnswerProtocol?
    
    init(team: Team = Team(name: "Ковбои", image: "cowboy")) {
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        
        super.setupViews()
        setupTeamVeiw()
        setupResulView()
        setupNextStep()
        setupScoreImage()
        setupGreenButton("Передать ход")
    }
    
    func configure(with team: Team, answer: Bool, next: String = "Стройняшки") {
        nextStep.text = "Следующий ход - \(next)"
        teamView.configure(with: team)
        if answer {
            configureCorrectAnswer()
        } else {
            configureWrongAnswer()
        }
    }
    
    override func greenButtonHandler() {
        navigationController?.popViewController(animated: true)
        delegate?.start()
    }
    
    func configureCorrectAnswer() {
        resultView.backgroundColor = UIColor(named: "greenButton")
        scoreImage.image = UIImage(named: "star")
    }
    
    func configureWrongAnswer() {
        resultView.backgroundColor = UIColor(named: "redButton")
        scoreImage.image = UIImage(named: "zero")
    }
    
    func setupTeamVeiw() {
        view.addSubview(teamView)
        teamView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            teamView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            teamView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
}

extension WrongViewController {
    func setupResulView() {
        view.addSubview(resultView)
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: teamView.bottomAnchor, constant: 86),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            resultView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupNextStep() {
        resultView.addSubview(nextStep)
        nextStep.translatesAutoresizingMaskIntoConstraints = false
        nextStep.textAlignment = .center
        NSLayoutConstraint.activate([
            nextStep.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -46),
            nextStep.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 16),
            nextStep.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupScoreImage() {
        resultView.addSubview(scoreImage)
        scoreImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreImage.bottomAnchor.constraint(equalTo: nextStep.topAnchor, constant: -8),
            scoreImage.centerXAnchor.constraint(equalTo: resultView.centerXAnchor)
        ])
    }
    
    
}

