import UIKit



class TeamViewController: BaseController {
    let model = TeamModel()
    var teams: [Team]
    let tableView = UITableView()
    
    
    
    
    
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
    
    func setupAddTeamButton(_ title: String) {
        view.addSubview(addTeamButton)
        addTeamButton.translatesAutoresizingMaskIntoConstraints = false
        addTeamButton.configure(with: .green,
                                title: title,
                                height: 63)
        addTeamButton.addTarget(self,
                                action: #selector(addNewTeam),
                                for: .primaryActionTriggered)
        
        
        NSLayoutConstraint.activate([
            addTeamButton.bottomAnchor.constraint(equalTo: greenButton.topAnchor,
                                                  constant: -14),
            addTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 14),
            addTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -14)
        ])
    }
    @objc func addNewTeam () {
        //        var teams: [Team]
        
        
        let alertController = UIAlertController(title: "Введите название команды", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Добавить команду", style: UIAlertAction.Style.default) { (alert) in
            let newTeam = alertController.textFields![0].text
            newTeamCrodile.append(newTeam!)
            print(newTeamCrodile)
            self.addNewTeamHandler()
            newTeamCrodile = ""
            
            
            
            
        })
        alertController.addTextField { (textField) in
            textField.placeholder = "Название команды"
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @objc func addNewTeamHandler () -> Bool {
        if newTeamCrodile.count > 0 {
            let allImages = model.allImages.randomElement()!
            let newIndexPath = IndexPath (row: newTeamCrodile.count, section: 0)
            self.teams.append(Team(name: newTeamCrodile, image: allImages ))
            
            tableView.reloadData()}
        
        
        return false
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
