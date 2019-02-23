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
    private let trackDetailInfoView: TrackDetailInfoView = TrackDetailInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        playerView.pause()
    }
    
}

// MARK: - Setup views
extension TrackDetailViewController {
    
    /**
     * Setup views
     */
    private func setupViews() {
        view.backgroundColor = .black()
        edgesForExtendedLayout = []
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * Configure subviews
     */
    private func configureSubviews() {
        playerView.backgroundColor = .black()
        
        trackDetailHeaderView.delegate = self
    }
    
}

// MARK: - Layout & constraints
extension TrackDetailViewController {
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(playerView)
        view.addSubview(trackDetailHeaderView)
        view.addSubview(trackDetailInfoView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: playerView)
        view.addConstraintsWithFormat("V:|[v0]", views: playerView)
        playerView.heightAnchor.constraint(equalTo: playerView.widthAnchor, multiplier: 9 / 16).isActive = true
        
        view.addConstraintsWithFormat("H:|[v0]|", views: trackDetailHeaderView)
        view.addConstraintsWithFormat("V:[v0][v1(\(trackDetailHeaderView.height))]", views: playerView, trackDetailHeaderView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: trackDetailInfoView)
        view.addConstraintsWithFormat("V:[v0][v1(>=0.0)]", views: trackDetailHeaderView, trackDetailInfoView)
    }
    
}

// MARK: - TrackDetailHeaderViewDelegate
extension TrackDetailViewController: TrackDetailHeaderViewDelegate {
    
    /**
     * Method to get the show in Music touch event
     */
    func showInMusicPressed() {
        presenter?.showInMusicSelected()
    }
    
}

// MARK: - TrackDetailViewInjection
extension TrackDetailViewController: TrackDetailViewInjection {
    
    /**
     * Load track
     *
     * - parameters:
     *      -track: track view model
     */
    func loadTrack(_ track: TrackViewModel) {
        if let previewUrl = track.previewUrl {
            playerView.prepare(with: previewUrl)
            playerView.play()
        }
        
        trackDetailInfoView.bindWithViewModel(track)
    }
    
}
