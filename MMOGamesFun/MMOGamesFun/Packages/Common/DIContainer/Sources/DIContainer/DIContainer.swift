import Resolver

public enum ContainerScope {
    case graph
    case application
    case shared
}

public typealias Container = Resolver

public enum DIContainer {
    public static let container = Resolver()

    public static func resolve<T>(_ type: T.Type = T.self) -> T! {
        container.resolve(type)
    }

    public static func register<T>(type: T.Type = T.self, object: @escaping @autoclosure () -> T, scope: ContainerScope = .graph) {
        container.register(type) { _ in
            object()
        }.scope(scope.mapToResolverScope())
    }

    public static func register<T>(type: T.Type = T.self, object: @escaping (Container) -> T, scope: ContainerScope = .graph) {
        container.register { resolver in
            object(resolver)
        }.scope(scope.mapToResolverScope())
    }

    public static func reset() {
        Resolver.reset()
    }
}

private extension ContainerScope {
    func mapToResolverScope() -> ResolverScope {
        switch self {
        case .graph:
            return .graph
        case .application:
            return .application
        case .shared:
            return .shared
        }
    }
}
