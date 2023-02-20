import Combine
import CombineExt
import DIContainer
@testable import GamesListScene
import GetGamesUseCase
import UIKit
import UnitTestingUtilities
import AddFavoriteGameUseCase
import RemoveFavoriteGameUseCase
import XCTest

class ViewModelTests: XCTestCase {
    var input: Input!
    var viewDidLoadSubject: PassthroughSubject<Void, Never>!
    var sut: ViewModel!

    override func setUp() {
        super.setUp()

        self.sut = ViewModel()
        self.viewDidLoadSubject = PassthroughSubject<Void, Never>()
        self.input = Input(viewDidLoadTrigger: viewDidLoadSubject.eraseToAnyPublisher())
    }

    func test_bind_whenUseCaseReturnsSuccess_thenReturnsCorrectDisplayRows() throws {
        // given
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self, object: GetGamesUseCaseMock(result: .success([])))

        // when
        let output = try awaitPublisher(sut.bind(input: input).displayRows, afterAction: {
            self.viewDidLoadSubject.send(())
        })

        // then
        XCTAssertTrue(output.isEmpty)
    }

    func test_bind_whenUseCaseReturnsMultipleGames_thenReturnsCorrectDisplayRows() throws {
        // given
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self, object: GetGamesUseCaseMock(result: .success(Game.games)))

        // when
        let output = try awaitPublisher(sut.bind(input: input).displayRows, afterAction: {
            self.viewDidLoadSubject.send(())
        })

        // then
        AssertEqual(output, [.init(title: "Example Game 1", subtitle: "[iOS] Example Developer", isFavorite: false, rowTapped: {}),
                             .init(title: "Example Game 2", subtitle: "[iOS] Example Developer", isFavorite: true, rowTapped: {})])
    }

    func test_bind_whenGetUseCaseReturnsError_thenReturnsError() throws {
        // given
        struct TestError: Error {}
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self, object: GetGamesUseCaseMock(result: .failure(TestError())))

        // when
        let output = try awaitPublisher(sut.bind(input: input).error, afterAction: {
            self.viewDidLoadSubject.send(())
        })

        // then
        XCTAssertTrue(output is TestError)
    }


    func test_addFavoriteGame_whenUseCaseSucceeds_thenExecutesAddFavoriteGame() throws {
        // given
        let addFavoriteGameUseCaseMock = AddFavoriteGameUseCaseMock()
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self, object: GetGamesUseCaseMock(result: .success([.game1])))
        DIContainer.register(type: AddFavoriteGameUseCase.UseCaseProtocol.self, object: addFavoriteGameUseCaseMock)

        // when
        let output = try awaitPublisher(sut.bind(input: input).displayRows, afterAction: {
            self.viewDidLoadSubject.send(())
        })
        output[0].rowTapped?()

        // then
        XCTAssertTrue(addFavoriteGameUseCaseMock.didExecuteCalled)
    }

    func test_removeFavoriteGame_whenUseCaseSucceeds_thenExecutesUseCaseRemoveFavoriteGame() throws {
        // given
        let removeFavoriteGameUseCaseMock = RemoveFavoriteGameUseCaseMock()
        DIContainer.register(type: GetGamesUseCase.UseCaseProtocol.self, object: GetGamesUseCaseMock(result: .success([.game2])))
        DIContainer.register(type: RemoveFavoriteGameUseCase.UseCaseProtocol.self, object: removeFavoriteGameUseCaseMock)

        // when
        let output = try awaitPublisher(sut.bind(input: input).displayRows, afterAction: {
            self.viewDidLoadSubject.send(())
        })
        output[0].rowTapped?()

        // then
        XCTAssertTrue(removeFavoriteGameUseCaseMock.didExecuteCalled)
    }
}
