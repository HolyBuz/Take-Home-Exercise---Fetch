//
//  DessertListViewModel.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

final class DessertListViewModel: ObservableObject {
    
    @Published private(set) var desserts = [Meal]()
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String? = nil
    
    private let service: DessertListServiceable
    
    init(service: DessertListServiceable) {
        self.service = service
    }
    
    @MainActor
    func getDesserts() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await service.getDessertList()
            sortDesserts(response.meals)
        } catch let error as NetworkError {
            errorMessage = "Failed to load meal details: \(error.customMessage)"
            
        } catch {
            errorMessage = "An unexpected error occurred."
        }
    }
    
    private func sortDesserts(_ desserts: [Meal]) {
        self.desserts = desserts.sorted(by: {$0.name < $1.name})
    }
}

