//
//  ArtFetcher.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/15/23.
//

import Foundation

class ArtFetcher: ObservableObject {
    @Published var art = [Artwork]()
    @Published var pagination = Pagination()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllArt()
    }
    
    func fetchAllArt() {
        guard !isLoading else {
            return
        }
        isLoading = true
        errorMessage = nil
        let url = URL(string: pagination.nextUrl)
        DispatchQueue.global().async { [unowned self] in
            service.fetchArt(url: url) { [unowned self] result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        print(error.localizedDescription)
                    case .success(let root):
                        self.art.append(contentsOf: root.art)
                        self.pagination = root.pagination
                    }
                }
            }
        }
        
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> ArtFetcher {
        let fetcher = ArtFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> ArtFetcher {
        let fetcher = ArtFetcher()
        fetcher.art = [Artwork.example1(), Artwork.example2()]
        
        return fetcher
    }
}
