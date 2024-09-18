//
//  Requestable.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

protocol Requestable {
    
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    
    func urlRequest() throws -> URLRequest
}

extension Requestable {
    
    private var scheme: String {
        "https"
    }
    
    func urlRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard
            let url = urlComponents.url
        else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

