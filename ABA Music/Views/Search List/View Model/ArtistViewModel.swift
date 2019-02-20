//
//  ArtistViewModel.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

struct ArtistViewModel {
    
    let artistName: String
    let trackName: String
    let artworkUrl: URL?
    let releaseDate: String
    let releaseYear: String
    let previewUrl: URL?
    let primaryGenreName: String
    
    init(artistName: String, trackName: String, artworkUrl: URL?, releaseDate: String, releaseYear: String, previewUrl: URL?, primaryGenreName: String) {
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
        self.releaseYear = releaseYear
        self.previewUrl = previewUrl
        self.primaryGenreName = primaryGenreName
    }
    
}

extension ArtistViewModel {

    public static func getViewModelsWith(_ artistResponse: [ArtistResponse]) -> [ArtistViewModel] {
        return artistResponse.map { getViewModelWith($0) }
    }
    
    private static func getViewModelWith(_ artistResponse: ArtistResponse) -> ArtistViewModel {
        let artworkUrl = ImageManager.shared.getExtraLargeUrlWith(URL(string: artistResponse.artworkUrl100), type: .large)
        var releaseYear = ""
        var date = ""
        if let releaseDate = Date.getISODateWithString(artistResponse.releaseDate) {
            releaseYear = releaseDate.getStringyyyyFormat()
            date = releaseDate.getStringMMMddyyyyFormat()
        }
        
        var previewUrl: URL?
        if let url = artistResponse.previewUrl {
            previewUrl = URL(string: url)
        }
        
        return ArtistViewModel(artistName: artistResponse.artistName, trackName: artistResponse.trackName, artworkUrl: artworkUrl, releaseDate: date, releaseYear: releaseYear, previewUrl: previewUrl, primaryGenreName: artistResponse.primaryGenreName)
    }
    
}
