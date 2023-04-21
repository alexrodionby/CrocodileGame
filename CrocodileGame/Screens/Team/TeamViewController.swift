import UIKit

class TeamViewController: BaseController {
    var teams = GameStore.shared.teams
    lazy var stack = UIStackView()
    
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
