//
//  Artwork.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/15/23.
//


/*
 imageID
 artistDisplay
 title
 dateDisplay
 mediumDisplay
 description
 creditLine
 copyrightNotice
 */
import Foundation

// Representation of the relevant details for a piece of art
struct Artwork: Hashable, Codable, Identifiable {
    // Unique identifier
    let id: Int
    // Title of the art piece
    let title: String
    // Artist display details
    let artistDisplay: String
    // Date display for artwork
    let dateDisplay: String
    // The id of the image, used to get image
    let imageID: String?
    // The medium of the art piece
    let mediumDisplay: String?
    // Description of the art piece
    let description: String?
    // Credit line for the art piece
    let creditLine: String?
    // Copyright notice for the art piece
    let copyrightNotice: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case artistDisplay = "artist_display"
        case dateDisplay = "date_display"
        case imageID = "image_id"
        case mediumDisplay = "medium_display"
        case description
        case creditLine = "credit_line"
        case copyrightNotice = "copyright_notice"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decode(Int.self, forKey: .id)
            title = try values.decode(String.self, forKey: .title)
            artistDisplay = try values.decode(String.self, forKey: .artistDisplay)
            dateDisplay = try values.decode(String.self, forKey: .dateDisplay)
            imageID = try? values.decode(String.self, forKey: .imageID)
            mediumDisplay = try? values.decode(String.self, forKey: .mediumDisplay)
            description = try? values.decode(String.self, forKey: .description)
            creditLine = try? values.decode(String.self, forKey: .creditLine)
            copyrightNotice = try? values.decode(String.self, forKey: .copyrightNotice)
        }
    }
    
    init(id: Int, title: String, artistDisplay: String, dateDisplay: String, imageID: String, mediumDisplay: String?,  description: String?,  creditLine: String?, copyrightNotice: String?){
        self.id = id
        self.title = title
        self.artistDisplay = artistDisplay
        self.dateDisplay = dateDisplay
        self.imageID = imageID
        self.mediumDisplay = mediumDisplay
        self.description = description
        self.creditLine = creditLine
        self.copyrightNotice = copyrightNotice
    }
    
    static func example1() -> Artwork {
        return Artwork(id: 51719, title: "Winter: Cat on a Cushion", artistDisplay: "Théophile-Alexandre Steinlen\nFrench, born Switzerland, 1859-1923", dateDisplay: "1909", imageID: "e8e67721-bbb1-d007-82bd-c430ea73db70", mediumDisplay: "Lithograph in 6 colors (red, ochre, yellow, black, gray-brown, brown) from two stones, with scraping on stone, on ivory wove paper", description: nil, creditLine: nil, copyrightNotice: nil)
    }
    
    static func example2() -> Artwork {
        return Artwork(id: 37926, title: "Le buste (The Bust)", artistDisplay: "Jacques Gaston Duchamp Villon\nFrench, 1875-1963", dateDisplay: "1938", imageID: "a70f80f4-e9a1-7b46-5abd-1c2cf2cece79", mediumDisplay: "Etching and drypoint on paper", description: nil, creditLine: nil, copyrightNotice: nil)
    }
}
