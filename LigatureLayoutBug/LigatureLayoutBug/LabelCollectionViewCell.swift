//
//  LabelCollectionViewCell.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    
    private var label = UILabel()
    private let marginOffset: CGFloat = 18.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
        contentView.addSubview(label)
        
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: marginOffset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginOffset)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with dataSource: String) {
        guard let font = UIFont(name: "Avenir-Book", size: 11) else { return }
        
        let attrs: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.kern: 0.6
        ]
        
        label.attributedText = NSAttributedString(string: dataSource, attributes: attrs)
    }
}
