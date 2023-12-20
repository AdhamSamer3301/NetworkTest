//
//  LeaguesRquests.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation
protocol RecipeRequestsProtocol {
  func getRecipes()
  var recipes: [RecipeDTO]? { get }
  var bindData: (() -> Void)? { get set }
}

class RecipeRequests: RecipeRequestsProtocol {
  var recipes: [RecipeDTO]? = [] {
    didSet {
      bindData?()
    }
  }
  var bindData: (() -> Void)? = {}
  func getRecipes() {
    NetworkService.fetch(url: RecipesAPI.allRecipes.baseURL) { (result: Result<[RecipeDTO], Error>) in
      switch result {
        case .success(let success):
          self.recipes = success
        case .failure(let failure):
          print(failure.localizedDescription)
      }
    }
  }
}
