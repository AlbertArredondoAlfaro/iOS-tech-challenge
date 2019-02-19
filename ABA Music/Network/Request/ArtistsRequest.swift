//
//  ArtistsRequest.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

struct ArtistsRequest: RequestProtocol {
    
    typealias ResponseType = ArtistsResponse
    var completion: ((Result<ArtistsResponse?>) -> Void)?
    var method: HTTPMethod = .get
    var url: URL?
    var encodableBody: Encodable?
    var simulatedResponseJSONFile: String?
    var verbose: Bool?
    var contentType: ContentType = .json
    var processHeader: Bool?
    var shouldRetry: Bool = true
    
    init(search: String?) {
        url = Endpoint.getArtistWith(search: search).url
    }
    
}
