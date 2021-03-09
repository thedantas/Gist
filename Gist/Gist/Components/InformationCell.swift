//
//  InformationCell.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

final class FileInformationCell: UITableViewCell, Reusable, ModelUpdatable, Tappable {
    struct Model {
        let type: String
        let filename: String
 
        let onTap: (() -> Void)?
    }

    private let typeLabel = UILabel()
    private let nameLabel = UILabel()

    private(set) var onTap: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with model: Model) {
        typeLabel.text = model.type
        nameLabel.text = model.filename
        onTap = model.onTap
    }

    private func setupUI() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)

        
        
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .leading
        contentStackView.axis = .vertical
        contentStackView.spacing = 3
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(typeLabel)
     
    
      
        contentView.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }

}

struct FileInformationCellRowConfigurator: RowConfigurator {
    typealias RowType = FileInformationCell
    var model: FileInformationCell.Model
}

