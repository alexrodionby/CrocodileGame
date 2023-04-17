import UIKit

public enum CrocodileButtonType {
    case green
    case red
    case gray
}

extension UIButton {
    func configure(with type: CrocodileButtonType, title: String) {
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        tintColor = .white
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17)
        switch type {
        case .green:
            backgroundColor = UIColor(named: "greenButton")
        case .red:
            backgroundColor = UIColor(named: "redButton")
        case .gray:
            backgroundColor = UIColor(named: "grayButton")
        }
    }
}
