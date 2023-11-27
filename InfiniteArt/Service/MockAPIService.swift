//
//  MockAPIService.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/22/23.
//

import Foundation

struct MockAPIService: APIServiceProtocol {
    
    var result: Result<Root, APIError>
    
    func fetchArt(url: URL?, completion: @escaping (Result<Root, APIError>) -> Void) {
        completion(result)
    }
}
