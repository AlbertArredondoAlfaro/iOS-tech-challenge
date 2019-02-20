//
//  TrackDetailInfoView.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import UIKit

class TrackDetailInfoView: UIView {
    
    private let trackNameLabel: UILabel = UILabel()
    private let artistNameLabel: UILabel = UILabel()
    private let trackInformationLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public func bindWithViewModel(_ viewModel: ArtistViewModel) {
        trackNameLabel.text = viewModel.trackName
        trackNameLabel.numberOfLines = 0
        
        artistNameLabel.text = viewModel.artistName
        artistNameLabel.numberOfLines = 0
        
        trackInformationLabel.text = "\(viewModel.primaryGenreName) \(viewModel.releaseDate)"
        trackInformationLabel.numberOfLines = 0
    }
    
}

// MARK: - Setup views
extension TrackDetailInfoView {
    
    private func setupViews() {
        backgroundColor = .black()
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        trackNameLabel.font = UIFont.mediumWithSize(size: 22.0)
        trackNameLabel.textColor = .white()
        
        artistNameLabel.font = UIFont.regularWithSize(size: 21.0)
        artistNameLabel.textColor = .white()

        trackInformationLabel.font = UIFont.regularWithSize(size: 13.0)
        trackInformationLabel.textColor = .white()
    }
    
}

// MARK: - Layout & constraints
extension TrackDetailInfoView {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(trackNameLabel)
        addSubview(artistNameLabel)
        addSubview(trackInformationLabel)
        
        addConstraintsWithFormat("H:|-16.0-[v0]-16.0-|", views: trackNameLabel)
        addConstraintsWithFormat("V:|[v0(>=0.0)]", views: trackNameLabel)
        
        addConstraintsWithFormat("H:|-16.0-[v0]-16.0-|", views: artistNameLabel)
        addConstraintsWithFormat("V:[v0]-5.0-[v1(>=0.0)]", views: trackNameLabel, artistNameLabel)
        
        addConstraintsWithFormat("H:|-16.0-[v0]-16.0-|", views: trackInformationLabel)
        addConstraintsWithFormat("V:[v0]-15.0-[v1(>=0.0)]", views: artistNameLabel, trackInformationLabel)
    }
    
}
