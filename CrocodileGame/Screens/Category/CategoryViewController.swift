import UIKit

class CategoryViewController: BaseController {
    var categories = GameStore.shared.categories
    lazy var stack = UIStackView()
    let tableView = UITableView()
    var selectedRow: Int? = nil
    
    override func setupViews() {
        super.setupViews()
        setupGreenButton("Начать игру")
        setupTableView()
        title = "Категории"
        addNavBarButton(at: .left, with: "")
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
    private func setupStack() {
        view.addSubview(stack)
        categories.forEach {
            stack.addArrangedSubview(CategoryView(category: $0))
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
    
    @objc
    private func didSelectCommand() {
        print("Выбрали команду")
    }
    
    override func greenButtonHandler() {
        let controller = GameViewController()
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
