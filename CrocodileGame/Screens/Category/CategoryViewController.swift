import UIKit

class CategoryViewController: BaseController {
    let teams: [Team]
    var categories = GameStore.shared.categories
    let tableView = UITableView()
    var selectedRow: Int? = nil
    
    init(teams: [Team]) {
        self.teams = teams
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Начать игру")
        setupTableView()
        title = "Категории"
        addNavBarButton(at: .left)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.id)
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
        let words = ["боль в животе", "борозда", "ботинки", "браг"]
        let brain = CrocodileBrain(words: words, teams: teams)
        let controller = GameViewController(brain: brain)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.id, for: indexPath) as? CategoryCell
        else { return UITableViewCell()}
        let category = categories[indexPath.row]
        cell.configure(with: category, selected: selectedRow == indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        tableView.reloadData()
    }
}
