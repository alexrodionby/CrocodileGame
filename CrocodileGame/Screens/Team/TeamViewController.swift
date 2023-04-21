import UIKit

class TeamViewController: BaseController {
    let model = TeamModel()
    let teams: [Team]
    lazy var stack = UIStackView()

    init(numberOfTeam: Int) {
        teams = model.randomTeams(count: numberOfTeam)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Игроки готовы")
        setupStack()
        title = "Кто играет?"
        addNavBarButton(at: .left, with: "")
    }
    
    private func setupStack() {
        view.addSubview(stack)
        teams.forEach {
            stack.addArrangedSubview(TeamView(team: $0))
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 28
        stack.axis = .vertical
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor,
                                       multiplier: 1),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                                           multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 2)
        ])
    }
    
    override func greenButtonHandler() {
        let controller = CategoryViewController(teams: teams)
        navigationController?.pushViewController(controller, animated: true)
    }
}
