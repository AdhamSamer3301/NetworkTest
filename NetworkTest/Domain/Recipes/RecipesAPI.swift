//
//  LeaguesAPI.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

enum RecipesAPI {
  case allRecipes
  case recipe(id: String)
}

extension RecipesAPI : BaseAPI {
  var baseURL: String {
    switch self {
      case .allRecipes: return Configurations.baseUrl
      case .recipe(let id): return Configurations.baseUrl + URLs.recipeDetail.rawValue + id
    }
  }
  
  var headers: [String : String]? {
    switch self {
      case .allRecipes, .recipe:
        return ["":""]
    }
  }
  
  var method: Methods {
    switch self {
      case .allRecipes, .recipe:
        return .get
    }
  }
  
  
}
