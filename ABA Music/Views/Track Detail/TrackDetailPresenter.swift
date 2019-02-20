//
//  TrackDetailPresenter.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class TrackDetailPresenter {
    
    private weak var view: TrackDetailViewInjection?
    private let track: ArtistViewModel
   
    // MARK - Lifecycle
    init(view: TrackDetailViewInjection, track: ArtistViewModel, navigationController: UINavigationController? = nil) {
        self.view = view
        self.track = track
    }
    
}

extension TrackDetailPresenter: TrackDetailPresenterDelegate {
    
    func viewDidLoad() {
        view?.loadTrack(track)
    }
    
}
