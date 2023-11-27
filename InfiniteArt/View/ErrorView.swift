//
//  ErrorView.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/15/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var artFetcher: ArtFetcher
    var body: some View {
        if let error = artFetcher.errorMessage {
            Text(error)
        } else {
            Text("OK")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(artFetcher: ArtFetcher())
    }
}
