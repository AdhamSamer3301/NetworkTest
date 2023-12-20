//
//  HomeViewModel.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
  var recipesPublisher: AnyPublisher<Bool?, Never>? { get }
  func getRecipes()
  var recipesCount: Int { get }
  func getRecipeBy(id: Int) -> Recipe?
  var bindDataToVC: (() -> Void)? { get set}
}
class HomeViewModel  {
  
  @Published var isPublished: Bool?
  var recipesPublisher: AnyPublisher<Bool?, Never>? {
    $isPublished.eraseToAnyPublisher()
  }
  var bindDataToVC: (() -> Void)? = {}
  var recipes: [Recipe] = [] {
    didSet {
      bindDataToVC?()
    }
  }
  var recipesRepo: RecipesRepositoryProtocol = RecipesRepository()
  
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
  func getRecipeBy(id: Int) -> Recipe? {
    guard recipes.indices.contains(id) else { return nil }
    return recipes[id]
  }
  
  
  var recipesCount: Int {
    recipes.count
  }
  
  func getRecipes() {
    recipesRepo.getRecipes()
    recipesRepo.bindData = { [weak self] in
      self?.recipes = self?.recipesRepo.mapped ?? []
      print(self?.recipes.count)
    }
  }
}
