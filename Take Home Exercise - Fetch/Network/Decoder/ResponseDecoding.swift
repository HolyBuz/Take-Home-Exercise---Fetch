//
//  ResponseDecoding.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

protocol ResponseDecoding {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}
