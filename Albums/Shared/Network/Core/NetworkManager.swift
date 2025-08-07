//
//  NetworkManager.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//

import SwiftUI
import Combine


final class NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession

    private init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(_ endpoint: APIEndpoint, responseType: T.Type) async throws -> T {
        let request = try RequestBuilder.buildRequest(from: endpoint)
        
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.badStatusCode(httpResponse.statusCode)
        }

        return try ResponseDecoder.decode(T.self, from: data)
    }
}


//enum NetworkError: Error {
//    case badURL
//    case requestFailed(Error)
//    case invalidResponse
//    case decodingError(Error)
//    case serverError(statusCode: Int)
//}

/*
class NetworkManager {
    static let shared = NetworkManager()
        private init() {}

        func request<T: Decodable>(
            urlString: String,
            method: String = "GET",
            body: Data? = nil,
            headers: [String: String] = ["Content-Type": "application/json"],
            responseType: T.Type
        ) async throws -> T {
            guard let url = URL(string: urlString) else {
                throw NetworkError.invalidURL
            }

            var request = URLRequest(url: url)
            request.httpMethod = method
            request.httpBody = body
            headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }

            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }

                guard 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.serverError(statusCode: httpResponse.statusCode)
                }

                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    return decoded
                } catch {
                    throw NetworkError.decodingError(error)
                }

            } catch {
                throw NetworkError.requestFailed(error)
            }
        }
}


extension NetworkManager {
    func requestPublisher<T: Decodable>(urlString: String, responseType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: responseType, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}*/
