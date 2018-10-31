//
//  ViewController.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var englishDataSource = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    private var inchesDataSource = ["78\"", "91\""]
    private var chineseDataSource = ["尺码过小", "尺码偏小", "尺码准确", "尺码偏大", "尺码过大"]
    
    private let brokenMinimumLineSpacing: CGFloat = 0.0
    private let workingMinimumLineSpacing: CGFloat = 8.0 //works with fixed collectionView
    private let marginSpacing: CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Button Flow Layout Bug"
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fill
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: marginSpacing),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        //working collection view
        let workingDescription = descriptionLabel(withText: "This is a working example of a horizontal collection view that implements a datasource of strings in english using only minimum inter-item spacing.")
        let workingCollectionView = layoutView(withDataSource: englishDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        
        stackView.addArrangedSubview(workingDescription)
        stackView.addArrangedSubview(workingCollectionView)
        
        //broken collection view
        let brokenDescription = descriptionLabel(withText: "This horizonal collection implements a datasource of strings in english and chinese characters that use ligatures. This is broken because the ligatures are breaking the minimum inter-item spacing causing the cells to press up againstone another.")
        let brokenInchesCollectionView = layoutView(withDataSource: inchesDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        let brokenChineseCollectionView = layoutView(withDataSource: chineseDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        stackView.addArrangedSubview(brokenDescription)
        stackView.addArrangedSubview(brokenInchesCollectionView)
        stackView.addArrangedSubview(brokenChineseCollectionView)
        
        //fixed collection view
        let fixedDescription = descriptionLabel(withText: "In this example the same datasources are being implemented and we set the minimum line spacing greater than 0.0. Once that happens, the result looks as though minimum inter-item spacing is being implemented but it's being ignored and minimum line spacing is being used instead.")
        let fixedInchesCollectionView = layoutView(withDataSource: inchesDataSource, minimumLineSpacing: workingMinimumLineSpacing)
        let fixedChineseCollectionView = layoutView(withDataSource: chineseDataSource, minimumLineSpacing: workingMinimumLineSpacing)
        stackView.addArrangedSubview(fixedDescription)
        stackView.addArrangedSubview(fixedInchesCollectionView)
        stackView.addArrangedSubview(fixedChineseCollectionView)
    }
    
    // MARK: Layout Convenience
    private func descriptionLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    private func layoutView(withDataSource dataSource: [String], minimumLineSpacing: CGFloat) -> LayoutView {
        let layoutView = LayoutView(with: dataSource, minimumLineSpacing: minimumLineSpacing)
        layoutView.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        return layoutView
    }
}

