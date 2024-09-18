//
//  Requesting.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

protocol Requesting {
    var responseDecoder: ResponseDecoding { get }
    
    func request<T: Decodable>(_ endpoint: Requestable) async throws -> T
}
