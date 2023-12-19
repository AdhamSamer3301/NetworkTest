//
//  LeaguesRquests.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation
protocol RecipeRequestsProtocol {
  func getRecipes() async throws -> [RecipeDTO]?
}

class RecipeRequests: RecipeRequestsProtocol {
  func getRecipes() async throws -> [RecipeDTO]? {
    try await NetworkService.fetch(url: RecipesAPI.allRecipes.baseURL)
  }
  
}
