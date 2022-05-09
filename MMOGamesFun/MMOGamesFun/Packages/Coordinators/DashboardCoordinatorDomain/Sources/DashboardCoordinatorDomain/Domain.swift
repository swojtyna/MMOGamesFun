//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//


import SwiftUI
import UIKit

// It should be better solution to break Coordinator into 2 packages Domain and Coordinator

public protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get set }

    func start() -> UIViewController
    func showGameList()
}
