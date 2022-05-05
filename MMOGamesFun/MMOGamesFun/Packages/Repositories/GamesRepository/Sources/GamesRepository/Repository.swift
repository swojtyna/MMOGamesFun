import Combine
import DIContainer
import MMOGamesAPI

public final class Repository: RepositoryProtocol {
    @LazyInjected
    var client: MMOGamesAPIProtocol

    public init() {}

    public func get(completion: @escaping Completion) {
        Task {
            do {
                let games = try await client.fetchGames()
                completion(.success(games.map(Game.init)))
            } catch {
                completion(.failure(error))
            }
        }
    }
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
