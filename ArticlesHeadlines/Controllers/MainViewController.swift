//
//  MainViewController.swift
//  ArticlesHeadlines
//
//  Created by Rex Jason Alobba on 6/12/2023.
//

import UIKit

class MainViewController: UIViewController {

    let nextButton = UIButton() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .blue
        nextButton.configuration?.title = "Test"
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
    }


}

