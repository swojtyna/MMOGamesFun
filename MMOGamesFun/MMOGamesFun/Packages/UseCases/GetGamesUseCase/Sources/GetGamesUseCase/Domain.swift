//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Foundation

public struct Game {
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let shortDescription: String?
    public let gameURL: String?
    public let genre: String
    public let platform: String
    public let publisher: String
    public let developer: String
    public let releaseDate: String?
    public let profileURL: String?

    public var additionalTestUseCaseProperty: String?
}

public typealias Completion = (Result<[Game], Error>) -> Void

public protocol UseCaseProtocol {
    func execute(completion: @escaping Completion)
}
