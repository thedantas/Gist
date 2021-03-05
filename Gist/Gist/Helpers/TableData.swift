//
//  TableData.swift
//  Gist
//
//  Created by André  Costa Dantas on 03/03/21.
//

import UIKit

protocol TableRowConfigurator {
    associatedtype RowType: Reusable, ModelUpdatable
    var model: RowType.Model { get }
}

protocol ModelUpdatable {
    associatedtype Model
    func update(with model: Model)
}

protocol Tappable {
    var onTap: (() -> Void)? { get }
}

protocol AnyHeaderFooterConfigurator {
    func configure(from tableView: UITableView) -> UITableViewHeaderFooterView?
}

protocol AnyRowConfigurator {
    func configure(from tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func didSelect(cell: UITableViewCell)
}

protocol HeaderFooterConfigurator: TableRowConfigurator, AnyHeaderFooterConfigurator { }
extension HeaderFooterConfigurator where RowType: UITableViewHeaderFooterView {
    func configure(from tableView: UITableView) -> UITableViewHeaderFooterView? {
        let headerFooter = tableView.dequeueHeaderFooter(RowType.self)
        headerFooter?.update(with: model)
        return headerFooter
    }
}

protocol RowConfigurator: TableRowConfigurator & AnyRowConfigurator { }
extension RowConfigurator where RowType: UITableViewCell {
    func configure(from tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(RowType.self, for: indexPath)
        cell.update(with: model)
        return cell
    }

    func didSelect(cell: UITableViewCell) {
        (cell as? Tappable)?.onTap?()
    }
}

protocol RowInformationVersion: TableRowConfigurator & AnyRowConfigurator { }
extension RowInformationVersion where RowType: UITableViewCell {
    func configure(from tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(RowType.self, for: indexPath)
        cell.update(with: model)
        return cell
    }

    func didSelect(cell: UITableViewCell) {
        (cell as? Tappable)?.onTap?()
    }
}

struct TableSection {
    var header: AnyHeaderFooterConfigurator?
    var rows: [AnyRowConfigurator]
    var footer: AnyHeaderFooterConfigurator?

    init(header: AnyHeaderFooterConfigurator? = nil, rows: [AnyRowConfigurator], footer: AnyHeaderFooterConfigurator? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}

final class TableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    var data = [TableSection]() {
        didSet { tableView?.reloadData() }
    }

    private weak var tableView: UITableView?

    init(with tableView: UITableView) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = UITableView.automaticDimension

        self.tableView = tableView
        super.init()

        tableView.dataSource = self
        tableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard data.count > section else {
            assertionFailure("Attempt to access an inexistent section index from table data")
            return 0
        }

        return data[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard data.count > indexPath.section else {
            assertionFailure("Attempt to access an inexistent section index from table data")
            return UITableViewCell()
        }

        guard data[indexPath.section].rows.count > indexPath.row else {
            assertionFailure("Attempt to access an inexistent row index from table data section \(indexPath.section)")
            return UITableViewCell()
        }

        return data[indexPath.section].rows[indexPath.row].configure(from: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return data[section].header?.configure(from: tableView)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return data[section].footer?.configure(from: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard data.count > indexPath.section else {
            assertionFailure("Attempt to access an inexistent section index from table data")
            return
        }

        guard data[indexPath.section].rows.count > indexPath.row else {
            assertionFailure("Attempt to access an inexistent row index from table data section \(indexPath.section)")
            return
        }

        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        data[indexPath.section].rows[indexPath.row].didSelect(cell: cell)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
