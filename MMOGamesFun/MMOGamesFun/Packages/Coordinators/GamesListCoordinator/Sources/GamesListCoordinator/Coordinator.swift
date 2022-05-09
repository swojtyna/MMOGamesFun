//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import DIContainer
import GamesListScene
import UIKit

public final class Coordinator: CoordinatorProtocol {
    public init() {}

    public func start() -> UIViewController {
        let gameListController = GamesListScene.ViewController()

        return gameListController
    }
}
