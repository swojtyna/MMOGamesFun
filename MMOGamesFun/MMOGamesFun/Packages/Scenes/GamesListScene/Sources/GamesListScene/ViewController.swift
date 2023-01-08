//
//  ViewController.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Combine
import DIContainer
import UIKit

public final class ViewController: UITableViewController {
    @LazyInjected
    var viewModel: ViewModelProtocol

    private lazy var adapter = Adapter(tableView: tableView)

    private var subscriptions = Set<AnyCancellable>()

    override public func viewDidLoad() {
        super.viewDidLoad()

        bind()

        setupTableView()

        title = "Games list"
    }

    private func bind() {
        let input = Input()
        let output = viewModel.bind(input: input)

        output.displayRows
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print("completion \($0)")
            }, receiveValue: { [adapter] displayRows in
                adapter.update(rows: displayRows)
            })
            .store(in: &viewModel.subscriptions)
    }

    private func setupTableView() {
        tableView.delegate = adapter
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Adapter.Constants.gameCellIdentifier)
    }
}
