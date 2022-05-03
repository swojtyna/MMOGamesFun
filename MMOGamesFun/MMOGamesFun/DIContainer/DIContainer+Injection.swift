//
//  DIContainer+Injection.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import Foundation
import DIContainer

import MMOGamesAPI

final class DIContainerInjection {
    static func registerAll() {
        DIContainer.register(type: MMOGamesAPIProtocol.self) { _ in
            MMOGamesAPI()
        }
    }
}
