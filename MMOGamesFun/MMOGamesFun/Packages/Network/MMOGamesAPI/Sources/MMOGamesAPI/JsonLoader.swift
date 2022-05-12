//
//  JsonLoader.swift
//  
//
//  Created by Sebastian Wojtyna on 12/05/2022.
//

import Foundation

@propertyWrapper
struct JsonLoader<T> where T: Decodable {
    private let fileName: String

    var wrappedValue: T {
        guard let result = loadJson(fileName: fileName) else {
            fatalError("Cannot load json data \(fileName)")
        }
        return result
    }

    init(_ fileName: String) {
        self.fileName = fileName
    }

    func loadJson(fileName: String) -> T? {
        guard let url = Bundle.module.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let result = try? JSONDecoder().decode(T.self, from: data)
        else {
            return nil
        }
        return result
    }
}
