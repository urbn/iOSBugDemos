//
//  LabelCollectionViewCell.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
        contentView.addSubview(label)
        
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with string: String){
        guard let font = UIFont(name: "Avenir-Book", size: 11) else { return }
        
        let attrs: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.kern: 0.6
        ]
        
        label.attributedText = NSAttributedString(string: string, attributes: attrs)
    }
}
