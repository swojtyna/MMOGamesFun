import Combine
import DIContainer
import FavoritesRepository

public final class UseCase: UseCaseProtocol {
    @LazyInjected
    var repository: RepositoryProtocol

    public init() {}

    public func execute(gameId: GameId) {
        repository.remove(gameId)
    }
}
