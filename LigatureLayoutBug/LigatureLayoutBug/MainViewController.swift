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
    }
}

