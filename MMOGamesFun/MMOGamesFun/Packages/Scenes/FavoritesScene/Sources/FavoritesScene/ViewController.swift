//
//  ViewController.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import Combine
import DIContainer
import UIKit

public final class ViewController: UIViewController {
    @LazyInjected
    var viewModel: ViewModelProtocol

    private var subscriptions = Set<AnyCancellable>()

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Favorites"
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

    private func update(accordingTo state: State) {
        switch state {
        case .populated(let displayRows):
            print("populated \(displayRows)")
        case .empty:
            print("empty")
        case .error:
            print("error")
        }
    }
}
