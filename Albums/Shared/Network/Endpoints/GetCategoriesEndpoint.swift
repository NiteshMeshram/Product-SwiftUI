//
//  GetCategoriesEndpoint.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

import SwiftUI

struct GetCategoriesEndpoint: APIEndpoint {
    var baseURL: String { "https://api.escuelajs.co" }
    var path: String { "/api/v1/categories" }
    var method: HTTPMethod { .get }
    var headers: [String : String]? { nil }
    var body: Data? { nil }
    var queryItems: [URLQueryItem]? { nil }
}
