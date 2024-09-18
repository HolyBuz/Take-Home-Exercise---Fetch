//
//  MealDetail.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import Foundation

struct MealDetail: Decodable {
    
    let idMeal: String
    let name: String
    let instructions: String
    let ingredients: [String]
    let measurements: [String]
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case name = "strMeal"
        case instructions = "strInstructions"
        
        // Ingredient and measurement keys
        case ingredient1 = "strIngredient1", ingredient2 = "strIngredient2", ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4", ingredient5 = "strIngredient5", ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7", ingredient8 = "strIngredient8", ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10", ingredient11 = "strIngredient11", ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13", ingredient14 = "strIngredient14", ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16", ingredient17 = "strIngredient17", ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19", ingredient20 = "strIngredient20"
        
        case measure1 = "strMeasure1", measure2 = "strMeasure2", measure3 = "strMeasure3"
        case measure4 = "strMeasure4", measure5 = "strMeasure5", measure6 = "strMeasure6"
        case measure7 = "strMeasure7", measure8 = "strMeasure8", measure9 = "strMeasure9"
        case measure10 = "strMeasure10", measure11 = "strMeasure11", measure12 = "strMeasure12"
        case measure13 = "strMeasure13", measure14 = "strMeasure14", measure15 = "strMeasure15"
        case measure16 = "strMeasure16", measure17 = "strMeasure17", measure18 = "strMeasure18"
        case measure19 = "strMeasure19", measure20 = "strMeasure20"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        // Decode ingredients and measurements
        
        ingredients = (1...20).compactMap { index in
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(index)")
            
            guard
                let key = ingredientKey,
                let ingredient = try? container.decodeIfPresent(String.self, forKey: key),
                !ingredient.isEmpty
            else {
                return nil
            }
            return ingredient
        }
        
        measurements = (1...20).compactMap { index in
            let measureKey = CodingKeys(rawValue: "strMeasure\(index)")
            
            guard 
                let key = measureKey,
                let measurement = try? container.decodeIfPresent(String.self, forKey: key),
                !measurement.isEmpty
            else {
                return nil
            }
            return measurement
        }
    }
}
