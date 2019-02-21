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
    private let router: TrackDetailRouterDelegate
   
    // MARK - Lifecycle
    init(view: TrackDetailViewInjection, track: ArtistViewModel, navigationController: UINavigationController? = nil) {
        self.view = view
        self.track = track
        self.router = TrackDetailRouter(navigationController: navigationController)
    }
    
}

extension TrackDetailPresenter: TrackDetailPresenterDelegate {
    
    func viewDidLoad() {
        view?.loadTrack(track)
    }
    
    func showInItunesSelected() {
        guard let url = track.trackViewUrl else {
            return
        }
        
        router.showTrackInItunesWithUrl(url)
    }
    
}
