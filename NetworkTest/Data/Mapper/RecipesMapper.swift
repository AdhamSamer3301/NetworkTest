//
//  LeaguesMapper.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

class RecipesMapper {
  func mapDTO(recipeDTO: [RecipeDTO]) -> [Recipe] {
    let mappedLeagues = recipeDTO.map { self.mapRecipeDTO(recipe: $0) }
    return mappedLeagues
  }
  private func mapRecipeDTO(recipe: RecipeDTO) -> Recipe {
    Recipe(
      name: recipe.name ?? "",
      image: recipe.image ?? "")
  }
}
