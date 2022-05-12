import Combine
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
    func games() -> AnyPublisher<[GameElement], Error>
}

public struct MMOGamesAPI: MMOGamesAPIProtocol {
    var session = URLSession.shared
    let url = URL(string: "https://www.mmobomb.com/api1/games")!

    public init() {}

//    public func games() -> AnyPublisher<[GameElement], Error> {
//        URLSession.shared.dataTaskPublisher(for: url)
//            .mapError { $0 as Error }
//            .map { $0.data }
//            .decode(type: [GameElement].self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//    }

    // MOCK for testing offline ;]
    @JsonLoader("games")
    var gamesElements: [GameElement]

    public func games() -> AnyPublisher<[GameElement], Error> {
        gamesElements.publisher
            .collect()
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
