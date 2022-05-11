import Combine
import DIContainer
import Foundation
import MMOGamesAPI

public final class Repository: RepositoryProtocol {
    @LazyInjected
    var client: MMOGamesAPIProtocol

    public lazy var games: AnyPublisher<[Game], Error>  = {
        client.games()
            .compactMap { $0.map(Game.init) }
            .eraseToAnyPublisher()
    }()

    public init() {}
}

private extension Game {
    init(gameAPI: GameElement) {
        self.id = gameAPI.id
        self.title = gameAPI.title
        self.thumbnail = gameAPI.thumbnail
        self.shortDescription = gameAPI.shortDescription
        self.gameURL = gameAPI.gameURL
        self.genre = gameAPI.genre
        self.platform = gameAPI.platform
        self.publisher = gameAPI.publisher
        self.developer = gameAPI.developer
        self.releaseDate = gameAPI.releaseDate
        self.profileURL = gameAPI.profileURL
    }
}
