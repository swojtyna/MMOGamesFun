import DIContainer
import Foundation

public struct GameElement: Codable {
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let shortDescription: String?
    public let gameURL: String?
    public let genre, platform, publisher, developer: String
    public let releaseDate: String?
    public let profileURL: String?

    public enum CodingKeys: String, CodingKey {
        case id, title, thumbnail
        case shortDescription
        case gameURL
        case genre, platform, publisher, developer
        case releaseDate
        case profileURL
    }
}

public protocol MMOGamesAPIProtocol {
    func fetchGames() async throws -> [GameElement]
}

public struct MMOGamesAPI: MMOGamesAPIProtocol {
    var session = URLSession.shared
    let url = URL(string: "https://www.mmobomb.com/api1/games")!

    public init() {}

    public func fetchGames() async throws -> [GameElement] {
        let (data, _) = try await session.data(from: url)

        return try JSONDecoder().decode([GameElement].self, from: data)
    }
}
