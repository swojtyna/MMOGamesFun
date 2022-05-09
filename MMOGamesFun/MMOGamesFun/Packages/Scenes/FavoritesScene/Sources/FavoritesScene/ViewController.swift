//
//  ViewController.swift
//  
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import DIContainer
import UIKit

public final class ViewController: UIViewController {
    @LazyInjected
    var viewModel: ViewModelProtocol

    override public func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChanged = { [weak self] state in
            self?.update(accordingTo: state)
        }

        update(accordingTo: viewModel.currentState)
        viewModel.get()
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
