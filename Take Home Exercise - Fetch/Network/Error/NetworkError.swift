//
//  NetworkError.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

enum NetworkError: Error {
    
    case decodingFailed
    case invalidURL
    case invalidResponse
    case unexpectedStatusCode
    
    var customMessage: String {
        switch self {
        case .decodingFailed:
            return "Error Decoding Data"
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid HTTP response"
        case .unexpectedStatusCode:
            return "Unexpected Server Status"
        }
    }
}
