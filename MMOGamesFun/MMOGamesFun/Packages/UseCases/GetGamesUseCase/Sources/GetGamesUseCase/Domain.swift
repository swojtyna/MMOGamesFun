//
//  Domain.swift
//
//
//  Created by Sebastian Wojtyna on 05/05/2022.
//

import Combine
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

    public var isFavorite: Bool = false

    public init(
        id: Int,
        title: String,
        thumbnail: String,
        shortDescription: String? = nil,
        gameURL: String? = nil,
        genre: String,
        platform: String,
        publisher: String,
        developer: String,
        releaseDate: String? = nil,
        profileURL: String? = nil,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.shortDescription = shortDescription
        self.gameURL = gameURL
        self.genre = genre
        self.platform = platform
        self.publisher = publisher
        self.developer = developer
        self.releaseDate = releaseDate
        self.profileURL = profileURL
        self.isFavorite = isFavorite
    }
}

public protocol UseCaseProtocol {
    func execute() -> AnyPublisher<[Game], Error>
}
