//
//  APIService.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/22/23.
//

import Foundation

import Foundation
import SwiftUI


struct APIService: APIServiceProtocol {
    func fetchArt(url: URL?, completion: @escaping(Result<Root, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
            
                do {
                    let root = try decoder.decode(Root.self, from: data)
                    completion(Result.success(root))
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }

        task.resume()
        
    }
}
