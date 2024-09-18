//
//  NetworkManager.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

struct NetworkManager {
   
    private var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        return URLSession(configuration: configuration)
    }
    
    let responseDecoder: ResponseDecoding
    
    init(responseDecoder: ResponseDecoding) {
        self.responseDecoder = responseDecoder
    }
}

// MARK: - Requesting

extension NetworkManager: Requesting {

    func request<T: Decodable>(_ endpoint: Requestable) async throws -> T {
        let urlRequest = try endpoint.urlRequest()
        let (data, response) = try await session.data(for: urlRequest)
        let decodedModel: T = try handleResponse(data: data, response: response)
        return decodedModel
    }
    
    private func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard
            let response = response as? HTTPURLResponse
        else {
            throw NetworkError.invalidResponse
        }
        
        switch response.statusCode {
        case 200...299:
            do {
                return try responseDecoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed
            }
            
        default:
            throw NetworkError.unexpectedStatusCode
        }
    }
}

