//
//  Domain.swift
//  
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation
import Combine

public typealias GameId = Int

public protocol RepositoryProtocol {
    var gamesIds: AnyPublisher<[GameId], Never> { get }

    func add(_ gameId: GameId)
    func remove(_ gameId: GameId)
}
