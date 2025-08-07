//
//  Logger.swift
//  Albums
//
//  Created by NiteshMeshram on 8/7/25.
//

import Foundation

struct Logger {
    static func logRequest(_ request: URLRequest) {
        print("➡️ Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
    }

    static func logResponse(data: Data?, response: URLResponse?) {
        if let httpResponse = response as? HTTPURLResponse {
            print("⬅️ Response: \(httpResponse.statusCode)")
        }
    }
}
