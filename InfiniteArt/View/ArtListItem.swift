//
//  ArtListItem.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/15/23.
//

import SwiftUI

struct ArtListItem: View {
    let art: Artwork
    let imageSize = 80.0
    var body: some View {
        ScrollView {
            HStack {
                let imageId = art.imageID ?? "4acf91a2-ae60-7826-82d3-706d9a0be6b8"
                let urlString = "https://www.artic.edu/iiif/2/" + String(imageId) + "/full/400,/0/default.jpg"
                let url = URL(string: urlString)
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize)
                            .clipped()
                        
                    } else if phase.error != nil {
                        ProgressView(phase.error?.localizedDescription ?? "")
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(art.title).bold().italic()
                    Text(art.artistDisplay)
                }
            }.padding(10)
        }
    }
}

struct ArtListItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtListItem(art: Artwork.example2())
    }
}
