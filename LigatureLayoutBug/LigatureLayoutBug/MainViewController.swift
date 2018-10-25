//
//  ViewController.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let cv = LabelCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Button Flow Layout Bug"
        view.backgroundColor = .white
        view.addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        cv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}

