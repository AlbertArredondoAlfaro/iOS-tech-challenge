//
//  SearchListInteractor.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

typealias getArtistsCompletionBlock = (Result<ArtistsResponse?>) -> Void

class SearchListInteractor {
    
    private let requestManager: RequestManager
    private var artistsViewModel: [ArtistViewModel]
    
    convenience init() {
        self.init(requestManager: RequestManager(), artistsViewModel: [ArtistViewModel]())
    }
    
    init(requestManager: RequestManager, artistsViewModel: [ArtistViewModel]) {
        self.requestManager = requestManager
        self.artistsViewModel = artistsViewModel
    }
    
}

extension SearchListInteractor {
    
    private func getArtists(search: String? = nil, simulatedJSONFile: String? = nil, completion: @escaping getArtistsCompletionBlock) {
        var artistsRequest = ArtistsRequest(search: search)
        
        artistsRequest.completion = completion
        artistsRequest.simulatedResponseJSONFile = simulatedJSONFile
        requestManager.send(request: artistsRequest)
    }
    
    private func updateArtistsWith(_ artists: [ArtistResponse]) {
        let artistsViewModel = ArtistViewModel.getViewModelsWith(artists)
        self.artistsViewModel.append(contentsOf: artistsViewModel)
    }
    
}

extension SearchListInteractor: SearchListInteractorDelegate {
    
    func getArtistsList(search: String?, completion: @escaping ArtistsGetArtistsCompletionBlock) {
        getArtists(search: search) { [weak self] (response) in
            guard let `self` = self else { return }
            
            switch response {
            case .success(let response):
                guard let response = response else {
                    completion(nil, false, nil)
                    return
                }
                
                self.updateArtistsWith(response.results)
                completion(self.artistsViewModel, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
    
    func clear() {
        artistsViewModel = []
    }
    
    func getRecipeSelectedAt(_ index: Int) -> ArtistViewModel? {
        if !artistsViewModel.indices.contains(index) { return nil }
        return artistsViewModel[index]
    }
    
}
