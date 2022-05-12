//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation
import Combine

public typealias GameId = Int

public protocol UseCaseProtocol {
    func execute(gameId: GameId)
}
