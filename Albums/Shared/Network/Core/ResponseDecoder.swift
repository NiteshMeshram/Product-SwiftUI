//
//  ResponseDecoder.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

import Foundation

struct ResponseDecoder {
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
