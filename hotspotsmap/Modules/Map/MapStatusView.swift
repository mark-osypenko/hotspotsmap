//
//  MapStatusView.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

class MapStatusView: UIView {

    let statusLabel: UILabel = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let background = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false

        background.contentView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .preferredFont(forTextStyle: .callout)
        statusLabel.numberOfLines = .zero
        statusLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 16),
            background.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            background.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16)
        ])

        background.clipsToBounds = true
        background.layer.cornerRadius = 16
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
