//
//  Meal.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

struct Meal: Decodable, Identifiable, Hashable {
    let name: String
    let thumbnailURL: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
        case id = "idMeal"
    }
}
