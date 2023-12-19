//
//  LeaguesRepo.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

protocol RecipesRepositoryProtocol {
  func getRecipes() async throws -> [Recipe]
}

class RecipesRepository: RecipesRepositoryProtocol {
  let recipeRequest: RecipeRequestsProtocol = RecipeRequests()
  let recipeMapper = RecipesMapper()
  
  func getRecipes() async throws -> [Recipe] {
    guard let data = try await recipeRequest.getRecipes() else { fatalError("Can't get data") }
    return recipeMapper.mapDTO(recipeDTO: data)
  }
  
}
