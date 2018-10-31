//
//  ViewController.swift
//  LigatureLayoutBug
//
//  Created by Nicole Souvenir on 10/25/18.
//  Copyright © 2018 Nicole Souvenir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let englishDataSource = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    private let inchesDataSource = ["78\"", "91\""]
    private let chineseDataSource = ["尺码过小", "尺码偏小", "尺码准确", "尺码偏大", "尺码过大"]
    
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
        let workingDescription = descriptionLabel(withText: "This is a working example of a horizontal collection view that implements a datasource of strings in english only using minimum inter-item spacing.")
        let workingCollectionView = layoutCollectionView(withDataObject: englishDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        stackView.addArrangedSubview(workingDescription)
        stackView.addArrangedSubview(workingCollectionView)
        
        //broken collection view
        let brokenDescription = descriptionLabel(withText: "This collection view implements a datasource of strings in english and chinese characters that use ligatures. The ligatures are breaking the minimum inter-item spacing causing the cells to press up againstone another.")
        let brokenInchesCollectionView = layoutCollectionView(withDataObject: inchesDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        let brokenChineseCollectionView = layoutCollectionView(withDataObject: chineseDataSource, minimumLineSpacing: brokenMinimumLineSpacing)
        stackView.addArrangedSubview(brokenDescription)
        stackView.addArrangedSubview(brokenInchesCollectionView)
        stackView.addArrangedSubview(brokenChineseCollectionView)

        //fixed collection view
        let fixedDescription = descriptionLabel(withText: "In this example, we set the minimum line spacing greater than 0.0. Once that happens, the result looks as though minimum inter-item spacing is being implemented but it's being ignored and minimum line spacing is being used instead.")
        let fixedInchesCollectionView = layoutCollectionView(withDataObject: inchesDataSource, minimumLineSpacing: workingMinimumLineSpacing)
        let fixedChineseCollectionView = layoutCollectionView(withDataObject: chineseDataSource, minimumLineSpacing: workingMinimumLineSpacing)
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

    private func layoutCollectionView(withDataObject dataObject: [String], minimumLineSpacing: CGFloat) -> ExampleCollectionView {
        let layoutCollectionView = ExampleCollectionView(withDataObject: dataObject, minimumLineSpacing: minimumLineSpacing)

        return layoutCollectionView
    }
}

