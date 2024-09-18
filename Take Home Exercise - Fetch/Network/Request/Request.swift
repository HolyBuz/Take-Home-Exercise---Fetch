//
//  Request.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

struct Request: Requestable {
   
    var host: String
    var path: String
    var method: RequestMethod
    var headers: [String : String]?
    var body: [String : String]?
    var queryItems: [URLQueryItem]?
    
    init(host: String,
         path: String,
         method: RequestMethod = .GET,
         headers: [String : String]? = nil,
         body: [String : String]? = nil,
         queryItems: [URLQueryItem]? = nil) {
        self.host = host
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.queryItems = queryItems
    }
}

