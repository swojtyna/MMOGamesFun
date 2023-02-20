import Combine
import DIContainer
import FavoritesRepository
import Foundation
import GamesRepository

public final class UseCase: UseCaseProtocol {
    @LazyInjected
    var gameRepository: GamesRepository.RepositoryProtocol

    @LazyInjected
    var favoritesRepository: FavoritesRepository.RepositoryProtocol

    public init() {}

    private lazy var favoritesGames = favoritesRepository
        .gamesIds
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()

    public func execute() -> AnyPublisher<[Game], Error> {
        gameRepository.games
            .combineLatest(favoritesGames)
            .compactMap { repoGames, repoGamesIds in
                let useCaseGames: [Game] = repoGames.map { game in
                    var useCaseGame = Game(gameRepo: game)
                    useCaseGame.isFavorite = repoGamesIds.contains(game.id)
                    return useCaseGame
                }
                return useCaseGames
            }
            .eraseToAnyPublisher()

//        struct TestError512321: Error { }
//        let testError2 = TestError512321()
//
//        return Fail(error: testError2).eraseToAnyPublisher()
    }
}

private extension Game {
    init(gameRepo: GamesRepository.Game) {
        self.id = gameRepo.id
        self.title = gameRepo.title
        self.thumbnail = gameRepo.thumbnail
        self.shortDescription = gameRepo.shortDescription
        self.gameURL = gameRepo.gameURL
        self.genre = gameRepo.genre
        self.platform = gameRepo.platform
        self.publisher = gameRepo.publisher
        self.developer = gameRepo.developer
        self.releaseDate = gameRepo.releaseDate
        self.profileURL = gameRepo.profileURL
    }
}
