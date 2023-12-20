//
//  NetworkService.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import Foundation

class NetworkService {
//  static func fetch<T>(url: String?) async throws -> T? where T: Decodable {
//         guard let myUrl = URL(string: url ?? "") else {
//             print("Invalid URL")
//             throw URLError(.badURL)
//         }
//
//         let (data, response) = try await URLSession.shared.data(from: myUrl)
//
//         guard let response = response as? HTTPURLResponse,
//               response.statusCode == 200
//         else { throw URLError(.badServerResponse) }
//
//         do {
//             let json = try JSONDecoder().decode(T?.self, from: data)
//             return json
//         } catch let error {
//             throw error
//         }
//     }
  static func fetch<T: Decodable>(url: String?, completion: @escaping ((Result<T, Error>) -> Void)) {
    guard let myUrl = URL(string: url ?? "") else {
      print("Invalid URL")
      return
    }

    let request = URLRequest(url: myUrl)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data else {
        completion(.failure(error.unsafelyUnwrapped))
        return
      }
      guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
        completion(.failure(URLError(.badServerResponse)))
        return
      }
      do {
        let json = try JSONDecoder().decode(T.self, from: data)
        completion(.success(json))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }
}
