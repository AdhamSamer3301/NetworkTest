//
//  NetworkService.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

class NetworkService {
  static func fetch<T>(url: String?) async throws -> T? where T: Decodable {
         guard let myUrl = URL(string: url ?? "") else {
             print("Invalid URL")
             throw URLError(.badURL)
         }

         let (data, response) = try await URLSession.shared.data(from: myUrl)

         guard let response = response as? HTTPURLResponse,
               response.statusCode == 200
         else { throw URLError(.badServerResponse) }

         do {
             let json = try JSONDecoder().decode(T?.self, from: data)
             return json
         } catch let error {
             throw error
         }
     }
}
