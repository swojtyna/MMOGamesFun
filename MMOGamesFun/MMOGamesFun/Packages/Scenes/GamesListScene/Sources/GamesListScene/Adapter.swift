//
//  File.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Extensions
import UIKit

// TODO:
// Change it to newer approach
// https://gist.github.com/emptyfuel/77d1154477789f160379d605678e62e6
final class Adapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    struct Constants {
        static let gameCellIdentifier = "GameCellIdentifier"
    }

    weak var tableView: UITableView?
    private var rows: [DisplayRow] = []

    func update(rows: [DisplayRow]) {
        self.rows = rows
        tableView?.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.gameCellIdentifier, for: indexPath)

        if let row = rows[safe: indexPath.row] {
            var content = cell.defaultContentConfiguration()

            content.image = UIImage(systemName: "star")
            content.text = row.title
            content.secondaryText = row.subtitle

            cell.contentConfiguration = content
        }

        return cell
    }
}
