//
//  DessertsService.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

/*
 DessertsService
 Service Layer responsible to call the network layer to get Desserts Data.
 */

import Foundation

protocol DessertListServiceable {
    func getDessertList() async throws -> MealListResponse
}

protocol DessertDetailServiceable {
    func getDessertDetail(for id: String) async throws -> MealDetailResponse
}

final class DessertsService {
    
    private let networkManager: Requesting
    
    init(networkManager: Requesting) {
        self.networkManager = networkManager
    }
}

// MARK: - DessertsListServiceable

extension DessertsService: DessertListServiceable {
   
    func getDessertList() async throws -> MealListResponse {
        
        let queryItems = [
            URLQueryItem(name: "c", value: "Dessert")
        ]
        
        let request = Request(
            host: "themealdb.com",
            path: "/api/json/v1/1/filter.php",
            method: .GET,
            queryItems: queryItems
        )

        return try await networkManager.request(request)
    }
}

// MARK: - DessertDetailServiceable

extension DessertsService: DessertDetailServiceable {

    func getDessertDetail(for id: String) async throws -> MealDetailResponse {
     
        let queryItems = [
            URLQueryItem(name: "i", value: id)
        ]
        
        let request = Request(
            host: "themealdb.com",
            path: "/api/json/v1/1/lookup.php",
            method: .GET,
            queryItems: queryItems
        )
        
        return try await networkManager.request(request)
    }
}

