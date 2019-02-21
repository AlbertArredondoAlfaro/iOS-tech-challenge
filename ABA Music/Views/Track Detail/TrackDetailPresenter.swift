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
    private let track: TrackViewModel
    private let router: TrackDetailRouterDelegate
   
    // MARK - Lifecycle
    init(view: TrackDetailViewInjection, track: TrackViewModel, navigationController: UINavigationController? = nil) {
        self.view = view
        self.track = track
        self.router = TrackDetailRouter(navigationController: navigationController)
    }
    
}

extension TrackDetailPresenter: TrackDetailPresenterDelegate {
    
    func viewDidLoad() {
        view?.loadTrack(track)
    }
    
    func showInMusicSelected() {
        guard let url = track.trackViewUrl else {
            return
        }
        
        router.showTrackInMusicWithUrl(url)
    }
    
}
