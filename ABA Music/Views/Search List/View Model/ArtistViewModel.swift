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
    
    init(artistName: String, trackName: String, artworkUrl: URL?, releaseDate: String) {
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
    }
    
}

extension ArtistViewModel {

    public static func getViewModelsWith(_ artistResponse: [ArtistResponse]) -> [ArtistViewModel] {
        return artistResponse.map { getViewModelWith($0) }
    }
    
    private static func getViewModelWith(_ artistResponse: ArtistResponse) -> ArtistViewModel {
        let artworkUrl = URL(string: artistResponse.artworkUrl100)
        var releaseYear = ""
        if let releaseDate = Date.getISODateWithString(artistResponse.releaseDate) {
            releaseYear = releaseDate.getStringyyyyFormat()
        }
        
        return ArtistViewModel(artistName: artistResponse.artistName, trackName: artistResponse.trackName, artworkUrl: artworkUrl, releaseDate: releaseYear)
    }
    
}
