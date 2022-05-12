import Combine
import DIContainer
import Foundation

public final class Repository: RepositoryProtocol {
    private var subject = CurrentValueSubject<Set<GameId>, Never>(Set<GameId>())
    private var favoritesGamesId = Set<GameId>()

    public lazy var gamesIds: AnyPublisher<[GameId], Never> = {
        subject
            .map(Array.init)
            .eraseToAnyPublisher()
    }()

    public func add(_ gameId: GameId) {
        favoritesGamesId.insert(gameId)
        subject.send(favoritesGamesId)
    }

    public func remove(_ gameId: GameId) {
        favoritesGamesId.remove(gameId)
        subject.send(favoritesGamesId)
    }

    public init() {}
}
