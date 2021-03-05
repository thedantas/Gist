//
//  GistCell.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit
import Kingfisher

final class DeviceCell: UITableViewCell, Reusable, ModelUpdatable, Tappable {
    struct Model {
        let description: String
        let login: String
        let state: String
        let image: String
        let onTap: (() -> Void)?
    }

    private let idLabel = UILabel()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let loginImageView = UIImageView()
    private(set) var onTap: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with model: Model) {
        idLabel.text = model.description
        nameLabel.text = model.login
        statusLabel.text = "State: \(model.state)"
        loginImageView.kf.setImage(with: URL(string: model.image))
        onTap = model.onTap
    }

    private func setupUI() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        idLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        statusLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        loginImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loginImageView.layer.cornerRadius = (loginImageView.frame.size.width ) / 2
        loginImageView.clipsToBounds = true
        loginImageView.layer.borderWidth = 3.0
        loginImageView.layer.borderColor = UIColor.white.cgColor
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .leading
        contentStackView.axis = .vertical
        contentStackView.spacing = 3
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(idLabel)
        contentStackView.addArrangedSubview(statusLabel)
    
        let horizontalContentStackView = UIStackView()
        horizontalContentStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalContentStackView.alignment = .leading
        horizontalContentStackView.axis = .horizontal
        horizontalContentStackView.spacing = 3
        horizontalContentStackView.addArrangedSubview(loginImageView)

        horizontalContentStackView.addArrangedSubview(contentStackView)
    
      
        contentView.addSubview(horizontalContentStackView)
        NSLayoutConstraint.activate([
            horizontalContentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalContentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            horizontalContentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            horizontalContentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }

}

struct DeviceRowConfigurator: RowConfigurator {
    typealias RowType = DeviceCell
    var model: DeviceCell.Model
}

