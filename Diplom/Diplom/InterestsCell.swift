import UIKit

class CustomCell: UICollectionViewCell {
    
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with interest: Interest) {
        textLabel.text = interest.interest
    }
    
    private func setUpLayout() {
        backgroundColor = .white
        contentView.addSubview(textLabel)
        textLabel.layer.borderWidth = 1
        textLabel.layer.borderColor = UIColor.black.cgColor
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.layer.cornerRadius = 10
        textLabel.font = UIFont(name: "Poppins-SemiBold", size: 10)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = nil
    }
    
}
