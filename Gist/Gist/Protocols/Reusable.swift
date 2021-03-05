//
//  Reusable.swift
//  Gist
//
//  Created by André  Costa Dantas on 03/03/21.
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    // https://forums.swift.org/t/relying-on-string-describing-to-get-the-name-of-a-type/16391
    static var reuseIdentifier: String { NSStringFromClass(self) }
}

// MARK: - Table View convenience methods
extension UITableView {

    /// Register an UITableViewCell to a UITableView.
    /// Be aware to use this only with viewcode type cells, this will not work properly with .xib and storyboard cells.
    ///
    func register<Cell>(_ cellType: Cell.Type) where Cell: UITableViewCell, Cell: Reusable {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Dequeue an UITableViewCell to a UITableView.
    /// Be aware to use this only with viewcode type cells, this will not work properly with .xib and storyboard cells.
    ///
    func dequeue<Cell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell where Cell: UITableViewCell, Cell: Reusable {
        // It's better to have the app crashing here. If we can't load the cell it means that we forgot to register it somewhere,
        // a regression test would catch this "problem" if the developer didn't found it yet. Worst case scenario it's better a
        // app crashing than an empty and useless list of nothing.
        return dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? Cell
            ?? Cell(style: .default, reuseIdentifier: cellType.reuseIdentifier)
    }
}

extension UITableView {
    /// Register an UITableViewHeaderFooterView to a UITableView.
    /// Be aware to use this only with viewcode type cells, this will not work properly with .xib and storyboard cells.
    ///
    func register<Cell>(_ cellType: Cell.Type) where Cell: UITableViewHeaderFooterView, Cell: Reusable {
        register(cellType, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Dequeue an UITableViewHeaderFooterView to a UITableView.
    /// Be aware to use this only with viewcode type cells, this will not work properly with .xib and storyboard cells.
    ///
    func dequeueHeaderFooter<Cell>(_ cellType: Cell.Type) -> Cell? where Cell: UITableViewHeaderFooterView, Cell: Reusable {
        // It's better to have the app crashing here. If we can't load the cell it means that we forgot to register it somewhere,
        // a regression test would catch this "problem" if the developer didn't found it yet. Worst case scenario it's better a
        // app crashing than an empty and useless list of nothing.
        return dequeueReusableHeaderFooterView(withIdentifier: cellType.reuseIdentifier) as? Cell
    }
}

