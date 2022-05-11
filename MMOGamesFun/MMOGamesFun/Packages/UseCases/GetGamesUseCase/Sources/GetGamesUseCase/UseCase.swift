import DIContainer
import GamesRepository
import Combine

public final class UseCase: UseCaseProtocol {
    @LazyInjected
    var repository: RepositoryProtocol

    public init() {}

    public func execute() -> AnyPublisher<[Game], Error> {
        repository.games
            .compactMap { $0.map(Game.init) }
            .eraseToAnyPublisher()
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

        self.additionalTestUseCaseProperty = "additionalTestUseCaseProperty"
    }
}
