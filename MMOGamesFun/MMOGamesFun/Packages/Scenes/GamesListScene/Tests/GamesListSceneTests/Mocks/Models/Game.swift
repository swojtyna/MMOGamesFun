//
//  File.swift
//  
//
//  Created by Sebastian Wojtyna on 20/02/2023.
//

@testable import GamesListScene
import XCTest
import GetGamesUseCase

extension GetGamesUseCase.Game {
    static let game1 = Game(
        id: 1,
        title: "Example Game 1",
        thumbnail: "https://example.com/thumbnail.jpg",
        genre: "Action",
        platform: "iOS",
        publisher: "Example Publisher",
        developer: "Example Developer",
        isFavorite: false
    )

    static let game2 = Game(
        id: 2,
        title: "Example Game 2",
        thumbnail: "https://example.com/thumbnail.jpg",
        genre: "Action",
        platform: "iOS",
        publisher: "Example Publisher",
        developer: "Example Developer",
        isFavorite: true
    )

    static let games = [game1, game2]
}

