//
//  Pagination.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/25/23.
//

import Foundation

struct Pagination: Decodable {
    var currentPage: Int
    var totalPages: Int
    var nextUrl: String
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case nextUrl = "next_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        currentPage = try values.decode(Int.self, forKey: .currentPage)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        nextUrl = try values.decode(String.self, forKey: .nextUrl)
    }
    
    init(currentPage: Int = 0, totalPages: Int = 0, nextUrl: String = "https://api.artic.edu/api/v1/artworks/") {
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.nextUrl = nextUrl
    }
}
