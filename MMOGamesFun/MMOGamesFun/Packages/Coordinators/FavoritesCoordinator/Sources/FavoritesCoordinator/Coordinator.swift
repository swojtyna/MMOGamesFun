//
//  Coordinator.swift
//
//
//  Created by Sebastian Wojtyna on 09/05/2022.
//

import DIContainer
import FavoritesScene
import UIKit

public final class Coordinator: CoordinatorProtocol {
    public init() {}

    public func start() -> UIViewController {
        let favoritesController = FavoritesScene.ViewController()
        let navigationController = UINavigationController(rootViewController: favoritesController)

        favoritesController.tabBarItem.title = "Favorites"
        favoritesController.tabBarItem.image = UIImage(systemName: "heart")
        favoritesController.tabBarItem.selectedImage = UIImage(systemName: "ellipsis.circle.fill")

        return navigationController
    }
}
