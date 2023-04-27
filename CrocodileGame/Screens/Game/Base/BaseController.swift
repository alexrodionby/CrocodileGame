import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    let backgroundImage = UIImageView(image: UIImage(named: "background"))
    let greenButton = UIButton(type: .system)
    let addTeamButton = UIButton (type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
        
    }
}
var team = TeamModel()
var newTeamCrodile = team.allNames

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

    func addNewTeam () {
//        var teams: [Team]
        
        
        let alertController = UIAlertController(title: "Введите название команды", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Добавить команду", style: UIAlertAction.Style.default) { (alert) in
            let newTeam = alertController.textFields![0].text
            newTeamCrodile.append(newTeam!)
            print(newTeamCrodile)
            
            
            self.addNewTeamHandler()
            
            
        })
        alertController.addTextField { (textField) in
            textField.placeholder = "Название команды"
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @objc func addNewTeamHandler () {
        let newTeamAdded = TeamViewController(team: newTeamCrodile.last!, lastTeam: 1)
        navigationController?.pushViewController(newTeamAdded, animated: true)
    }
   
    
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
}
