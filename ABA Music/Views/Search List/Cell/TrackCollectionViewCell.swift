//
//  TrackCollectionViewCell.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    
    private let trackImageView: UIImageView = UIImageView()
    
    /**
     * Identifier for reusable cells
     */
    static public var identifier : String {
        return String(describing: self)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func bindWithViewModel(_ viewModel: ArtistViewModel) {
        configureArtWorkWithUrl(viewModel.artworkUrl)
    }
    
}

extension TrackCollectionViewCell {
    
    private func configureArtWorkWithUrl(_ url: URL?) {
        guard let url = url else {
            return
        }
        trackImageView.hnk_setImage(from: url, placeholder: nil)
    }
    
}

// MARK:- Layout & Constraints
extension TrackCollectionViewCell {
    
    /**
     * Private struct for internal layout
     */
    private struct Layout {
        
    }
    
    /**
     * Common init method to setup all the components
     */
    private func setupViews() {
        configureSubviews()
        addSubviews()
    }
    
    /**
     * Configure the elements inside the component
     */
    private func configureSubviews() {
        backgroundColor = .red
        
        trackImageView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        trackImageView.backgroundColor = .clear
        trackImageView.contentMode = .scaleAspectFill
        trackImageView.layer.cornerRadius = 8.0
        trackImageView.clipsToBounds = true
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(trackImageView)
        
        addConstraintsWithFormat("H:|[v0]|", views: trackImageView)
        addConstraintsWithFormat("V:|[v0(100.0)]", views: trackImageView)
    }
    
}

