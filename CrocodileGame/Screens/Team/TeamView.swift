import UIKit

final class TeamCell: UITableViewCell {
    static let id = "TeamCell"
    let teamView = TeamView()
    func configure(with team: Team) {
        backgroundColor = .clear
        contentView.addSubview(teamView)
        teamView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            teamView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            teamView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            teamView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        teamView.configure(with: team)
    }
}
final class TeamView: UIView {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let scoreLabel = UILabel()
    let scoreTitle = UILabel()

    let scoreStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with team: Team) {
        imageView.image = UIImage(named: team.image)
        titleLabel.text = team.name
        scoreLabel.text = "\(team.score)"
        scoreTitle.text = team.formatScore
        scoreStack.isHidden = team.score == 0
    }
}

extension TeamView {
    private func setupViews() {
        setupView()
        setupImageView()
        setupTitleLabel()
        setupScoreStack()
    }
    
    private func setupView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 96).isActive = true
        layer.cornerRadius = 10
    }
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 56),
            imageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    
    private func setupScoreStack() {
        addSubview(scoreStack)
        scoreStack.translatesAutoresizingMaskIntoConstraints = false
        scoreStack.addArrangedSubview(scoreLabel)
        scoreLabel.font = .italicSystemFont(ofSize: 30)
        scoreStack.addArrangedSubview(scoreTitle)
        scoreStack.axis = .vertical
        scoreStack.alignment = .trailing
        NSLayoutConstraint.activate([
            scoreStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            scoreStack.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8)
        ])
    }
}
