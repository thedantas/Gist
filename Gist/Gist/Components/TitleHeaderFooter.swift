//
//  TitleHeaderFooter.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

final class TitleHeaderFooter: UITableViewHeaderFooterView, Reusable, ModelUpdatable {
    struct Model {
        let title: String
    }

    private let titleLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)

        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }

    func update(with model: Model) {
        titleLabel.text = model.title
    }
}

struct TitleHeaderFooterConfigurator: HeaderFooterConfigurator {
    typealias RowType = TitleHeaderFooter
    var model: TitleHeaderFooter.Model
}
