//
//  GistCell.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit
import Kingfisher

final class GistCell: UITableViewCell {
  
     let idLabel = UILabel()
     let nameLabel = UILabel()
     let statusLabel = UILabel()
     let loginImageView = UIImageView()
     let favoriteButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return button
    }()
  
    @objc func increaseFunc() {

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        favoriteButton.addTarget(self, action: #selector(increaseFunc), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(description: String, login: String, state: String, image: String) {
          idLabel.text = description
          nameLabel.text = login
          statusLabel.text = "types: \(state)"
          loginImageView.kf.setImage(with: URL(string: image))
        
      }

    private func setupUI() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        idLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        statusLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        loginImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loginImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
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
        horizontalContentStackView.addArrangedSubview(favoriteButton)
        horizontalContentStackView.distribution = .fill
        contentView.addSubview(horizontalContentStackView)
        NSLayoutConstraint.activate([
            horizontalContentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalContentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            horizontalContentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            horizontalContentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }

}

