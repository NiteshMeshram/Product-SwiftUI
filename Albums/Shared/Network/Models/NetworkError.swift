//
//  NetworkError.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case noData
    case decodingFailed(Error)
    case badStatusCode(Int)
}
