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
   
    // MARK - Lifecycle
    init(view: TrackDetailViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
    }
    
}

extension TrackDetailPresenter: TrackDetailPresenterDelegate {
    
}
