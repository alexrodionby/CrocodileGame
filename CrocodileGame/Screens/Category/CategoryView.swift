import UIKit

final class CategoryCell: UITableViewCell {
    static let id = "CategoryCell"
    let categoryView = CategoryView()
    func configure(with category: Category, selected: Bool = false) {
        backgroundColor = .clear
        contentView.addSubview(categoryView)
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        categoryView.configure(with: category, selected: selected)
    }
}

final class CategoryView: UIView {
    let category: Category
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let selectedImage = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
    init(category: Category = Category(name: "Животные", image: "animal", color: "animalColor", fileName: "")) {
        self.category = category
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category, selected: Bool = false) {
        imageView.image = UIImage(named: category.image)
        titleLabel.text = category.name
        backgroundColor = UIColor(named: category.color)
        selectedImage.isHidden = !selected
    }
    func configure(with color: UIColor) {
        backgroundColor = color
    }
}

extension CategoryView {
    private func setupViews() {
        backgroundColor = UIColor(named: category.color)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 96).isActive = true
        layer.cornerRadius = 10
        setupImageView()
        setupTitleLabel()
        setupSelectedImage()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = category.name
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: category.image)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 56),
            imageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupSelectedImage() {
        addSubview(selectedImage)
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        selectedImage.tintColor = .white
        NSLayoutConstraint.activate([
            selectedImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            selectedImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            selectedImage.widthAnchor.constraint(equalToConstant: 30),
            selectedImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
