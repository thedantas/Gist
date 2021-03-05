//
//  InsertGroupedTableView.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

final class InsetGroupedTableView: UITableView {
    init() {
        if #available(iOS 13.0, *) {
            super.init(frame: .zero, style: .insetGrouped)
        } else {
            super.init(frame: .zero, style: .grouped)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

