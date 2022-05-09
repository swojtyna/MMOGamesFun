//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import DashboardCoordinatorDomain
import DIContainer
import Foundation
import GetGamesUseCase

public final class ViewModel: ViewModelProtocol {
    @LazyInjected
    var getListUseCase: UseCaseProtocol

    public var coordinator: DashboardCoordinatorDomain.CoordinatorProtocol!

    public init() {}

    public func showGamesList() {
        coordinator.showGameList()
    }
}
