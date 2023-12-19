//
//  BaseAPI.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

enum Methods {
  case get
  case post
}

protocol BaseAPI {
  var baseURL: String { get }
  var headers: [String: String]? { get }
  var method: Methods { get }
}
