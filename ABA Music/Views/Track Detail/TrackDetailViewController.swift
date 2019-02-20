//
//  TrackDetailViewController.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import Foundation

class TrackDetailViewController: BaseViewController {
    
    public var presenter: TrackDetailPresenterDelegate?
    
    private let playerView: PlayerView = PlayerView()
    private let trackDetailHeaderView: TrackDetailHeaderView = TrackDetailHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigationBar()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension TrackDetailViewController {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        view.backgroundColor = .black()
        edgesForExtendedLayout = []
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * ConfigureSubviews
     */
    private func configureSubviews() {
        playerView.backgroundColor = .black()
    }
    
    private func configureNavigationBar() {
    }
    
}

// MARK: - Layout & constraints
extension TrackDetailViewController {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(playerView)
        view.addSubview(trackDetailHeaderView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: playerView)
        view.addConstraintsWithFormat("V:|[v0]", views: playerView)
        playerView.heightAnchor.constraint(equalTo: playerView.widthAnchor, multiplier: 9 / 16).isActive = true
        
        view.addConstraintsWithFormat("H:|[v0]|", views: trackDetailHeaderView)
        view.addConstraintsWithFormat("V:[v0][v1(\(trackDetailHeaderView.height))]", views: playerView, trackDetailHeaderView)
    }
    
}

extension TrackDetailViewController: TrackDetailViewInjection {
    
    func loadTrack(_ track: ArtistViewModel) {
        if let previewUrl = track.previewUrl {
            playerView.prepare(with: previewUrl)
            playerView.play()
        }
    }
    
}
