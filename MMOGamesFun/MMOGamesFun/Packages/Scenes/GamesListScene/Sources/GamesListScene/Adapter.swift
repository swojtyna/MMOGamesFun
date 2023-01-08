//
//  Adapter.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Extensions
import UIKit

final class Adapter: NSObject {
    enum Constants {
        static let gameCellIdentifier = "GameCellIdentifier"
    }

    typealias TableDataSource = UITableViewDiffableDataSource<Int, AnyHashable>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Int, AnyHashable>

    private weak var tableView: UITableView!
    private var dataSource: TableDataSource!

    init(tableView: UITableView) {
        super.init()

        self.tableView = tableView
        dataSource = makeDataSource()
    }

    func update(rows: [DisplayRow]) {
        var snapshot = DataSourceSnapshot()

        defer {
            dataSource.apply(snapshot)
        }

        if rows.isEmpty {
            snapshot.appendSections([0])
            snapshot.appendItems([EmptyRow(emptyMessage: "We're sorry! Try again later!")])
            return
        }

        snapshot.appendSections([0])
        snapshot.appendItems(rows)
    }


    private func makeDataSource() -> TableDataSource {
        TableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.gameCellIdentifier, for: indexPath)
            cell.selectionStyle = .none
            var content = cell.defaultContentConfiguration()

            var image: UIImage?
            var text: String?
            var secondaryText: String?

            if let displayRow = item as? DisplayRow {
                image = displayRow.isFavorite ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "heart")
                text = displayRow.title
                secondaryText = displayRow.subtitle
            } else if let emptyRow = item as? EmptyRow {
                image = UIImage(systemName: "exclamationmark.circle")
                text = emptyRow.emptyMessage
                secondaryText = nil
            }

            content.image = image
            content.text = text
            content.secondaryText = secondaryText

            cell.contentConfiguration = content

            return cell
        })
    }
}

extension Adapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (dataSource.itemIdentifier(for: indexPath) as? DisplayRow)?.rowTapped?()
    }
}
