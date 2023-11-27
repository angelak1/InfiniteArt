//
//  ContentView.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var artFetcher = ArtFetcher()
    var body: some View {
        if artFetcher.errorMessage != nil {
            ErrorView(artFetcher: artFetcher)
        } else {
            ArtListView(artFetcher: artFetcher)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
