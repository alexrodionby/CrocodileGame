import UIKit

class CategoryViewController: BaseController {
    let teams: [Team]
    let model = CategoryModel()
    let tableView = UITableView()
    var selectedRow: Int? = nil {
        didSet { greenButton.isEnabled = selectedRow != nil }
    }
    
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
        greenButton.isEnabled = false
        addNavBarButton(at: .left)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.id)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: greenButton.topAnchor, constant: -8)
        ])
    }
    
    override func greenButtonHandler() {
        guard let index = selectedRow else { return }
        let words = model.fetchWords(at: index, count: 20)
        let brain = CrocodileBrain(words: words, teams: teams)
        let controller = GameViewController(brain: brain)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.id, for: indexPath) as? CategoryCell
        else { return UITableViewCell()}
        let category = model.categories[indexPath.row]
        cell.configure(with: category, selected: selectedRow == indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        tableView.reloadData()
    }
}
