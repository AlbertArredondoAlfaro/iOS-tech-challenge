//
//  TrackHeaderView.swift
//  ABA Music
//
//  Created by Ricardo Casanova on 20/02/2019.
//  Copyright © 2019 ABA English. All rights reserved.
//

import UIKit

protocol TrackDetailHeaderViewDelegate {
    func showInMusicPressed()
}

class TrackDetailHeaderView: UIView {
    
    public var delegate: TrackDetailHeaderViewDelegate?
    
    private let showInMusicButton: UIButton = UIButton(type: .custom)
    
    /**
     * Get component's height
     */
    public var height: CGFloat {
        return 16.0 + 40.0 + 16.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
}

// MARK: - Setup views
extension TrackDetailHeaderView {
    
    private func setupViews() {
        backgroundColor = .black()
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        showInMusicButton.titleLabel?.font = UIFont.regularWithSize(size: 16.0)
        showInMusicButton.layer.cornerRadius = 10.0
        showInMusicButton.layer.borderWidth = 1.0
        showInMusicButton.layer.borderColor = UIColor.white().cgColor
        showInMusicButton.setTitle("View in Music", for: .normal)
        showInMusicButton.addTarget(self, action: #selector(showInMusicButtonPressed), for: .touchUpInside)
    }
    
}

// MARK: - Layout & constraints
extension TrackDetailHeaderView {
    
    /**
     * Private struct for internal layout
     */
    private struct Layout {
        
        struct ShowInMusicButton {
            static let width: CGFloat = 150.0
            static let height: CGFloat = 40.0
            static let trailing: CGFloat = 16.0
            static let top: CGFloat = 16.0
            static let bottom: CGFloat = 40.0
        }
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(showInMusicButton)
        addConstraintsWithFormat("H:[v0(\(Layout.ShowInMusicButton.width))]-\(Layout.ShowInMusicButton.trailing)-|", views: showInMusicButton)
        addConstraintsWithFormat("V:|-\(Layout.ShowInMusicButton.top)-[v0(\(Layout.ShowInMusicButton.height))]-\(Layout.ShowInMusicButton.bottom)-|", views: showInMusicButton)
    }
    
}

// MARK: - User actions
extension TrackDetailHeaderView {
    
    @objc private func showInMusicButtonPressed() {
        delegate?.showInMusicPressed()
    }
    
}
