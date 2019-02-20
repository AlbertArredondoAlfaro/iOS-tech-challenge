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
    private var suggestions: [SuggestionViewModel]
    
    convenience init() {
        self.init(requestManager: RequestManager(), artistsViewModel: [ArtistViewModel](), suggestions: [SuggestionViewModel]())
    }
    
    init(requestManager: RequestManager, artistsViewModel: [ArtistViewModel], suggestions: [SuggestionViewModel]) {
        self.requestManager = requestManager
        self.artistsViewModel = artistsViewModel
        self.suggestions = suggestions
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
    
    private func saveSearch(_ search: String?) {
        guard let search = search else { return }
        SearchSuggestionsManager.shared.saveSuggestion(search)
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
                if !response.results.isEmpty {
                    self.saveSearch(search)
                }
                completion(self.artistsViewModel, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
    
    func clear() {
        artistsViewModel = []
    }
    
    func getTrackSelectedAt(section: Int, index: Int) -> ArtistViewModel? {
        let dictionary = Dictionary(grouping: artistsViewModel, by: { $0.artistName })
        let keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        
        guard let tracks = dictionary[keysArray[section]] else {
            return nil
        }
        
        if !tracks.indices.contains(index) { return nil }
        
        return tracks[index]
    }
    
    func getAllSuggestions(completion: @escaping TrackListGetSuggestionsCompletionBlock) {
        let allSuggestions = SearchSuggestionsManager.shared.getSuggestions()
        suggestions = SuggestionViewModel.getViewModelsWith(suggestions: allSuggestions)
        completion(suggestions)
    }
    
    func getSuggestionAt(index: Int) -> SuggestionViewModel? {
        if !suggestions.indices.contains(index) { return nil }
        
        return suggestions[index]
    }
    
}
