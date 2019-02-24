//
//  TrackViewModel.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

struct TrackViewModel {
    
    let artistName: String
    let trackName: String
    let artworkUrl: URL?
    let releaseDate: String
    let releaseYear: String
    let previewUrl: URL?
    let primaryGenreName: String
    let trackViewUrl: URL?
    
    init(artistName: String, trackName: String, artworkUrl: URL?, releaseDate: String, releaseYear: String, previewUrl: URL?, primaryGenreName: String, trackViewUrl: URL?) {
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
        self.releaseYear = releaseYear
        self.previewUrl = previewUrl
        self.primaryGenreName = primaryGenreName
        self.trackViewUrl = trackViewUrl
    }
    
}

extension TrackViewModel {

    /**
     * Get the view models (array) from the tracks response array
     *
     * - parameters:
     *      -trackResponse: the tracks response array
     */
    public static func getViewModelsWith(_ trackResponse: [TrackResponse]) -> [TrackViewModel] {
        return trackResponse.map { getViewModelWith($0) }
    }
    
    /**
     * Get the view model (single view model) from the track response
     *
     * - parameters:
     *      -trackResponse: the track response
     */
    private static func getViewModelWith(_ trackResponse: TrackResponse) -> TrackViewModel {
        let artworkUrl = ImageManager.shared.getExtraLargeUrlWith(URL(string: trackResponse.artworkUrl100), type: .large)
        var releaseYear = ""
        var date = ""
        if let releaseDate = Date.getISODateWithString(trackResponse.releaseDate) {
            releaseYear = releaseDate.getStringyyyyFormat()
            date = releaseDate.getStringMMMddyyyyFormat()
        }
        
        var previewUrl: URL?
        if let url = trackResponse.previewUrl {
            previewUrl = URL(string: url)
        }
        
        let trackViewUrl = URL(string: trackResponse.trackViewUrl)
        
        return TrackViewModel(artistName: trackResponse.artistName, trackName: trackResponse.trackName, artworkUrl: artworkUrl, releaseDate: date, releaseYear: releaseYear, previewUrl: previewUrl, primaryGenreName: trackResponse.primaryGenreName, trackViewUrl: trackViewUrl)
    }
    
}
