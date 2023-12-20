//
//  LeaguesRepo.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

protocol RecipesRepositoryProtocol {
  func getRecipes()
  var mapped:[Recipe] { get }
  var bindData: (() -> Void)? { get set }
}

class RecipesRepository: RecipesRepositoryProtocol {
  var bindData: (() -> Void)? = {}
  var recipeRequest: RecipeRequestsProtocol = RecipeRequests()
  let recipeMapper = RecipesMapper()
  var mapped:[Recipe] = [] {
    didSet {
      bindData?()
    }
  }
  func getRecipes() {
    recipeRequest.getRecipes()
    recipeRequest.bindData = { [weak self] in
      self?.mapped = self?.recipeMapper.mapDTO(recipeDTO: self?.recipeRequest.recipes ?? []) ?? []
      print("Mapped: \(String(describing: self?.mapped.count))")
    }
  }
  
}
