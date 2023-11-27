//
//  SearchView.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/14/23.
//

import SwiftUI

struct ArtListView: View {
    var filteredArt: [Artwork] {
        if searchText.isEmpty {
            return artFetcher.art
        } else {
            return artFetcher.art.filter { $0.title.lowercased().contains(searchText.lowercased()) || $0.artistDisplay.lowercased().contains(searchText.lowercased())
            }
        }
    }
    @StateObject var artFetcher: ArtFetcher
    @State var searchText: String = ""
    var body: some View {
            NavigationView {
                List {
                    ForEach(filteredArt) { item in
                        if item.imageID != nil {
                            NavigationLink {
                                ArtDetailView(art: item)
                            } label: {
                                ArtListItem(art: item)
                                    .onAppear() {
                                        let thresholdIndex = artFetcher.art.index(artFetcher.art.endIndex, offsetBy: -2)
                                        if artFetcher.art.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
                                            artFetcher.fetchAllArt()
                                        }
                                    }
                            }
                        }
                    }
                    
                    if artFetcher.isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading").frame(alignment: .init(horizontal: .center, vertical: .center))
                            Spacer()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Art Institute of Chicago")
            .searchable(text: $searchText)
        }
}

struct ArtListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtListView(artFetcher: ArtFetcher.successState())
    }
}
