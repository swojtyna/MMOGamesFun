//
//  ViewController.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import DIContainer
import UIKit

public final class ViewController: UITableViewController {
    @LazyInjected
    var viewModel: ViewModelProtocol

    private lazy var adapter = Adapter()

    override public func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupAdapter()

        viewModel.stateChanged = { [weak self] state in
            self?.update(accordingTo: state)
        }

        update(accordingTo: viewModel.currentState)
        viewModel.get()
    }

    private func setupTableView() {
        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Adapter.Constants.gameCellIdentifier)
    }

    private func setupAdapter() {
        adapter.tableView = tableView
    }

    private func update(accordingTo state: State) {
        switch state {
        case .populated(let displayRows):
            adapter.update(rows: displayRows)
        case .empty:
            print("empty")
            adapter.update(rows: [])
        case .error:
            print("error")
        }
    }
}
