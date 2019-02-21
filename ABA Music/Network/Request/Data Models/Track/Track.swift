//
//  Track.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

public struct TracksResponse: Decodable {
    
    let resultCount: UInt
    let results: [TrackResponse]
    
}

public struct TrackResponse: Decodable {
    
    let artistName: String
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String?
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
    
}
