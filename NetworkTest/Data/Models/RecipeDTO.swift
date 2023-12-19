//
//  LeagueDTO.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

struct RecipeDTO: Decodable {
  let id: String?
  let image: String?
  let name: String?
  let headline: String?

  let time: String?
  let calories: String?
  let favorites: Int?

  let description: String?
  let ingredients: [String]?
  let fats: String?
  let carbos: String?
  let fibers: String?
  let proteins: String?
}

struct Recipe {
  var name: String
  var image: String
}
