import UIKit

protocol CorrectAnswerProtocol: AnyObject {
    func start()
}

class CorrectViewController: BaseController {
    let team: Team
    lazy var teamView = TeamView()
    let resultView = UIView()
    let scoreText = UILabel()
    //Correct labels
    let starView = UIImageView(image: UIImage (named: "star"))
    let scoreView = UIImageView(image: UIImage (named: "score"))
    let congratulationLabel = UILabel()
    let youGet = UILabel()
    let nextStep = UILabel()
    //Incorrect labels
    let circleView = UIImageView(image: UIImage (named: "circle"))
    let scoreZeroView = UIImageView(image: UIImage (named: "zero"))
    let youDontGetScoreLabel = UILabel()
    let sadCongratsLabel = UILabel()
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
        setupGreenButton("Передать ход")
    }
    
    func configure(with team: Team, answer: Bool, next: String = "Стройняшки") {
        nextStep.text = "Следующий ход - \(next)"
        teamView.configure(with: team)
        if answer {
            setupResulView()
            configureCorrectAnswer()
            setupNextStep()
            setupStarAndScoreView()
            youGetLabelView ()
            congratulationView ()
            scoreAddtoView()
        } else {
            setupResulView()
            setupNextStep()
            configureWrongAnswer()
            setupNextStep()
            setupZeroAndScoreView()
            youDontGetTheScore()
            sadCongrats()
        }
    }
    
    override func greenButtonHandler() {
        navigationController?.popViewController(animated: true)
        delegate?.start()
    }
    
    func configureCorrectAnswer() {
        resultView.backgroundColor = UIColor(named: "greenButton")
    }
    
    func configureWrongAnswer() {
        resultView.backgroundColor = UIColor(named: "redButton")
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

// Green View and labels
extension CorrectViewController {
    
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
    
    func setupStarAndScoreView() {
        resultView.addSubview(starView)
        starView.addSubview(scoreView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        starView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            starView.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            starView.bottomAnchor.constraint(equalTo: nextStep.topAnchor, constant: -20),
            scoreView.centerXAnchor.constraint(equalTo: starView.centerXAnchor, constant: -4),
            scoreView.bottomAnchor.constraint(equalTo: nextStep.topAnchor, constant: -45)
        ])
        
    }
    
    func youGetLabelView () {
        resultView.addSubview(youGet)
        youGet.translatesAutoresizingMaskIntoConstraints = false
        youGet.text = "Вы получаете:"
        youGet.textAlignment = .center
        NSLayoutConstraint.activate([
            youGet.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 21),
            youGet.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -21),
            youGet.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -190)
            
        ])
    }
    
    func congratulationView () {
        resultView.addSubview(congratulationLabel)
        congratulationLabel.translatesAutoresizingMaskIntoConstraints = false
        congratulationLabel.text = "Поздравляем!"
        congratulationLabel.font = UIFont.boldSystemFont(ofSize: 30)
        congratulationLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            congratulationLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 80),
            congratulationLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -80),
            congratulationLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -236)
            
        ])
    }
    
    func scoreAddtoView () {
        resultView.addSubview(scoreText)
        scoreText.text = "ОЧКО"
        scoreText.textColor = UIColor (named: "yellowScoreColor")
        scoreText.font = UIFont.systemFont(ofSize: 15)
        scoreText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreText.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            scoreText.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -76)
        ])
        
    }
    
    
//Red view and labels
    
    func setupZeroAndScoreView() {
        resultView.addSubview(circleView)
        circleView.addSubview (scoreZeroView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        scoreZeroView.translatesAutoresizingMaskIntoConstraints = false
        circleView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            circleView.bottomAnchor.constraint(equalTo: nextStep.topAnchor, constant: -20),
            scoreZeroView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0),
            scoreZeroView.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -105)
        ])
//
    }
//
    func youDontGetTheScore () {
        resultView.addSubview(youDontGetScoreLabel)
        youDontGetScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        youDontGetScoreLabel.text = "Вы не отгадали слово и не получаете очков!"
        youDontGetScoreLabel.textAlignment = .center
        youDontGetScoreLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            youDontGetScoreLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 21),
            youDontGetScoreLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -21),
            youDontGetScoreLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -190)

        ])
    }

    func sadCongrats () {
        resultView.addSubview(sadCongratsLabel)
        sadCongratsLabel.translatesAutoresizingMaskIntoConstraints = false
        sadCongratsLabel.text = "Увы и АХ!"
        sadCongratsLabel.font = UIFont.boldSystemFont(ofSize: 30)
        sadCongratsLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            sadCongratsLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 80),
            sadCongratsLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -80),
            sadCongratsLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -236)

        ])
    }
    
    
}
