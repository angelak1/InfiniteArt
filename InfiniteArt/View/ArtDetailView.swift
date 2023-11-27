//
//  ArtDetailView.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/26/23.
//

import SwiftUI

struct ArtDetailView: View {
    let art: Artwork
    let imageSize = 400.0
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5.0) {
                let imageId = art.imageID ?? "4acf91a2-ae60-7826-82d3-706d9a0be6b8"
                let urlString = "https://www.artic.edu/iiif/2/" + String(imageId) + "/full/400,/0/default.jpg"
                let url = URL(string: urlString)
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                        
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }

                let artist = art.artistDisplay.split(separator: "\n")
                if let name = artist.first {
                    Text(String(name)).bold().font(.body)
                }
                if artist.count > 1 {
                    Text(artist.last ?? "")
                }
                
                Spacer()
                Text(art.title).bold().italic() +
                Text(", \(art.dateDisplay)")
                if let medium = art.mediumDisplay {
                    Text(medium)
                }
                
                Spacer()
                if let description = art.description {
                    let nsAttributedText = description.convertHtmlToString
                    Text(nsAttributedText)
                }
                
                if let creditLine = art.creditLine {
                    Text(creditLine).font(.footnote)
                }
                
                if let copyrightNotice = art.copyrightNotice {
                    Text(copyrightNotice).font(.footnote)
                }
            }.padding(10)
        }.navigationTitle(art.title)
    }
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtDetailView(art: Artwork.example1())
    }
}
