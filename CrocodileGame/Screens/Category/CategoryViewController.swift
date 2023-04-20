import UIKit

class CategoryViewController: BaseController {
    var categories = GameStore.shared.categories
    lazy var stack = UIStackView()

    override func setupViews() {
        super.setupViews()
        setupGreenButton("Начать игру")
        setupStack()
        title = "Категории"
        addNavBarButton(at: .left, with: "")
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
