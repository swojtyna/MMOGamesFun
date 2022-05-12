//
//  ViewController.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import DIContainer
import UIKit

public final class ViewController: UITableViewController {
    @LazyInjected
    var viewModel: ViewModelProtocol

    private lazy var adapter = Adapter()
    private var subscriptions = Set<AnyCancellable>()

    override public func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupAdapter()

        title = "Favorites list"
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.state
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print("completion \($0)")
            }, receiveValue: { [unowned self] state in
                self.update(accordingTo: state)
            })
            .store(in: &subscriptions)
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
