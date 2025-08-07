//
//  APIEndpoint.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

import SwiftUI

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension APIEndpoint {
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path += path
        components?.queryItems = queryItems
        return components?.url
    }
}
