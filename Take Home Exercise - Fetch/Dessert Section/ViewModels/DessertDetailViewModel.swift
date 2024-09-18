//
//  DessertDetailViewModel.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

final class DessertDetailViewModel: ObservableObject {
    
    @Published private(set) var instructions: String? = nil
    @Published private(set) var ingredients: AttributedString? = nil
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String? = nil
    
    private let service: DessertDetailServiceable
    private let dessertID: String
    let name: String
    
    init(service: DessertDetailServiceable, dessert: Meal) {
        self.service = service
        self.name = dessert.name
        self.dessertID = dessert.id
    }
    
    @MainActor
    func getDessertDetail() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await service.getDessertDetail(for: dessertID)
            
            guard let mealDetail = response.meals.first else {
                errorMessage = "Meal details not found."
                isLoading = false
                return
            }
            
            updateView(with: mealDetail)
        } catch {
            errorMessage = "Failed to load meal details: \(error.localizedDescription)"
        }
    }
    
    private func updateView(with mealDetail: MealDetail) {
        isLoading = false
        instructions = mealDetail.instructions
        ingredients = formatIngredients(mealDetail)
    }
    
    private func formatIngredients(_ mealDetail: MealDetail) -> AttributedString {
        var result = AttributedString()
        
        for (ingredient, measurement) in zip(mealDetail.ingredients, mealDetail.measurements) {
            if !ingredient.isEmpty && !measurement.isEmpty {
                let attributedIngredient = AttributedString("\(ingredient): ")
                
                var attributedMeasurement = AttributedString("\(measurement) \n")
                attributedMeasurement.underlineStyle = .single
                
                result +=  (attributedIngredient + attributedMeasurement)
            } else if !ingredient.isEmpty {
                result += AttributedString("\(ingredient)\n")
            } else if !measurement.isEmpty {
                result += AttributedString("\(measurement)\n")
            }
        }
        
        return result
    }
}

