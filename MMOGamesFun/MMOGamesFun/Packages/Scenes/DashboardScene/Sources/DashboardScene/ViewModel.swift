//
//  ViewModel.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import DIContainer
import Foundation
import GetGamesUseCase

public final class ViewModel: ViewModelProtocol {
    @LazyInjected
    var getListUseCase: UseCaseProtocol

    public init() {}

    public func showGamesList() {
        print("ShowGameList")
    }
}
