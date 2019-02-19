//
//  Artist.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

public struct ArtistsResponse: Decodable {
    
    let resultCount: UInt
    let results: [ArtistResponse]
    
}

public struct ArtistResponse: Decodable {
    
    let wrapperType: String
    let kind: String
    let artistId: UInt
    let collectionId: UInt
    let trackId: UInt
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String
    let previewUrl: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Float
    let trackPrice: Float
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: UInt
    let discNumber: UInt
    let trackCount: UInt
    let trackNumber: UInt
    let trackTimeMillis: UInt
    let country: String
    let currency: String
    let primaryGenreName: String
    
}
