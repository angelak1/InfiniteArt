//
//  Root.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/25/23.
//

import Foundation

struct Root: Decodable {
    let art: [Artwork]
    let pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case art = "data"
        case pagination
    }
}
