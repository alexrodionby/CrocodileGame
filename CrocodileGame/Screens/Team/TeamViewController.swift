import UIKit



class TeamViewController: BaseController {
    let model = TeamModel()
    let teams: [Team]
    let tableView = UITableView()

  
    
    

    init(numberOfTeam: Int) {
        teams = model.randomTeams(count: numberOfTeam)
        super.init(nibName: nil, bundle: nil)
    }
    init(team: String, lastTeam: Int) {
        teams = model.lastTeam(count: lastTeam)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Игроки готовы")
        setupAddTeamButton ("Добавить команду")
        setupTableView()
        title = "Кто играет?"
        addNavBarButton(at: .left)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(TeamCell.self, forCellReuseIdentifier: TeamCell.id)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: greenButton.topAnchor, constant: -80)
        ])
    }
        
    override func greenButtonHandler() {
        let controller = CategoryViewController(teams: teams)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension TeamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.id, for: indexPath) as? TeamCell else { return UITableViewCell()}
        cell.configure(with: teams[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
