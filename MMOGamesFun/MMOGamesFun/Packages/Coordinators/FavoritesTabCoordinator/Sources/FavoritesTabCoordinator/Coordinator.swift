//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import DIContainer
import FavoritesCoordinator
import UIKit

public final class Coordinator: CoordinatorProtocol {
    @LazyInjected
    var favoritesCoordinator: FavoritesCoordinator.CoordinatorProtocol

    public init() {}

    public func start() -> UIViewController {
        let favoritesController = favoritesCoordinator.start()

        favoritesController.tabBarItem.title = "Favorites"
        favoritesController.tabBarItem.image = UIImage(systemName: "heart")
        favoritesController.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")

        return favoritesController
    }
}
