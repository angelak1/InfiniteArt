//
//  APIServiceProtocol.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/22/23.
//

import Foundation


protocol APIServiceProtocol {
    func fetchArt(url: URL?, completion: @escaping(Result<Root, APIError>) -> Void)
}
