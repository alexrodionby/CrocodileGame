import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    let backgroundImage = UIImageView(image: UIImage(named: "background"))
    let greenButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    func setupViews() {
        setupBackgroundImage()
    }
    func layoutViews() {}
    func configureAppearance() {}
    func navBarLeftButtonHandler() {
        navigationController?.popViewController(animated: true)
    }
    func navBarRightButtonHandler() {}
    func greenButtonHandler() {}
}

extension BaseController {
    private func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addNavBarButton(at position: NavBarPosition, with title: String = "") {
        let button = UIButton(type: .system)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .primaryActionTriggered)
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .primaryActionTriggered)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
        view.layoutIfNeeded()
    }
    
    func setupGreenButton(_ title: String) {
        view.addSubview(greenButton)
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.configure(with: .green,
                                     title: title,
                                     height: 63)
        greenButton.addTarget(self,
                                     action: #selector(greenButtonHandler),
                                     for: .primaryActionTriggered)
        
        
        NSLayoutConstraint.activate([
            greenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                       constant: -14),
            greenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                        constant: 14),
            greenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                         constant: -14)
        ])
    }
}
