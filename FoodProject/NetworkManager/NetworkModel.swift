// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let food = try? JSONDecoder().decode(Food.self, from: jsonData)

import Foundation

// MARK: - Food
struct Food: Codable {
    let recipes: [Recipe]?
}

// MARK: - Recipe
struct Recipe: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText, license, sourceName: String?
    let pricePerServing: Double?
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let summary: String?
    let cuisines, dishTypes, diets, occasions: [String]?
    let instructions: String?
    let spoonacularSourceURL: String?
}

//
// MARK: - Salad
struct Salad: Codable {
    let results: [Results]?
    let offset, number, totalResults: Int?
}

// MARK: - Result
struct Results: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: ImageType?
    let readyInMinutes, servings: Int?
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}

//

