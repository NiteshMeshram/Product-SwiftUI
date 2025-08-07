//
//  RequestBuilder.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

import Foundation

struct RequestBuilder {
    static func buildRequest(from endpoint: APIEndpoint) throws -> URLRequest {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        endpoint.headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
