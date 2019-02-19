//
//  SearchListInteractor.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 19/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class SearchListInteractor {
}

extension SearchListInteractor: SearchListInteractorDelegate {
    
    func getArtistsList(search: String?, completion: @escaping ArtistsGetArtistsCompletionBlock) {
    }
    
    func clear() {
    }
    
    func getRecipeSelectedAt(_ index: Int) -> ArtistViewModel? {
        return nil
    }
    
}
