//
//  SearchListInteractor.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

typealias getArtistsCompletionBlock = (Result<TracksResponse?>) -> Void

class SearchListInteractor {
    
    private let requestManager: RequestManager
    private var tracksViewModel: [TrackViewModel]
    private var suggestions: [SuggestionViewModel]
    
    convenience init() {
        self.init(requestManager: RequestManager(), tracksViewModel: [TrackViewModel](), suggestions: [SuggestionViewModel]())
    }
    
    init(requestManager: RequestManager, tracksViewModel: [TrackViewModel], suggestions: [SuggestionViewModel]) {
        self.requestManager = requestManager
        self.tracksViewModel = tracksViewModel
        self.suggestions = suggestions
    }
    
}

extension SearchListInteractor {
    
    private func getTracks(search: String? = nil, simulatedJSONFile: String? = nil, completion: @escaping getArtistsCompletionBlock) {
        var tracksRequest = TracksRequest(search: search)
        
        tracksRequest.completion = completion
        tracksRequest.simulatedResponseJSONFile = simulatedJSONFile
        requestManager.send(request: tracksRequest)
    }
    
    private func updateTracksWith(_ tracks: [TrackResponse]) {
        let tracksViewModel = TrackViewModel.getViewModelsWith(tracks)
        self.tracksViewModel.append(contentsOf: tracksViewModel)
    }
    
    private func saveSearch(_ search: String?) {
        guard let search = search else { return }
        SearchSuggestionsManager.shared.saveSuggestion(search)
    }
    
    private func getRandomSearch() -> String {
        let searchArray = ["The Beatles", "Oasis", "Blur", "The Verve"]
        guard let randomSearch = searchArray.randomElement() else {
            return "The Beatles"
        }
        
        return randomSearch
    }
    
}

extension SearchListInteractor: SearchListInteractorDelegate {
    
    func getTracksList(search: String?, completion: @escaping TracksGetTracksCompletionBlock) {
        getTracks(search: search) { [weak self] (response) in
            guard let `self` = self else { return }
            
            switch response {
            case .success(let response):
                guard let response = response else {
                    completion(nil, false, nil)
                    return
                }
                
                self.updateTracksWith(response.results)
                if !response.results.isEmpty {
                    self.saveSearch(search)
                }
                completion(self.tracksViewModel, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
    
    func clear() {
        tracksViewModel = []
    }
    
    func getTrackSelectedAt(section: Int, index: Int) -> TrackViewModel? {
        let dictionary = Dictionary(grouping: tracksViewModel, by: { $0.artistName })
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
    
    func getInitialSearch() -> String {
        guard let lastSuggestion = SearchSuggestionsManager.shared.getLastSuggestion() else {
            return getRandomSearch()
        }
        
        return lastSuggestion.suggestion
    }
    
}
