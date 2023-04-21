import UIKit

final class TeamView: UIView {
    let team: Team
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let scoreStack = UIStackView()
    
    init(team: Team) {
        self.team = team
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with color: UIColor) {
        backgroundColor = color
    }
}

extension TeamView {
    private func setupViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 96).isActive = true
        layer.cornerRadius = 10
        setupImageView()
        setupTitleLabel()
        setupScoreLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = team.name
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 58),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: team.image)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 56),
            imageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupScoreLabel() {
        addSubview(scoreStack)
        scoreStack.translatesAutoresizingMaskIntoConstraints = false
        let scoreLabel = UILabel()
        scoreStack.addArrangedSubview(scoreLabel)
        scoreLabel.text = "\(team.score)"
        scoreLabel.font = .italicSystemFont(ofSize: 50)
        let scoreTitle = UILabel()
        scoreStack.addArrangedSubview(scoreTitle)
        scoreTitle.text = "Очки"
        scoreStack.axis = .vertical
        scoreStack.isHidden = team.score == 0
        NSLayoutConstraint.activate([
            scoreStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
