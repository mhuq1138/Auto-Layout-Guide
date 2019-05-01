//
//  ViewController.swift
//  Simple Auto Layout
//
//  Created by Mazharul Huq on 4/19/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        self.view.addSubview(redView)
        let blueView = UIView()
        blueView.backgroundColor = .blue
        redView.addSubview(blueView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([redView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        redView.widthAnchor.constraint(equalToConstant: 240),
        redView.heightAnchor.constraint(equalToConstant: 130),
        redView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    NSLayoutConstraint.activate([blueView.bottomAnchor.constraint(equalTo: redView.layoutMarginsGuide.bottomAnchor, constant:0),
        blueView.rightAnchor.constraint(equalTo: redView.layoutMarginsGuide.rightAnchor, constant:0),
        blueView.topAnchor.constraint(equalTo: redView.layoutMarginsGuide.topAnchor, constant:0),
        blueView.leftAnchor.constraint(equalTo: redView.layoutMarginsGuide.leftAnchor, constant:0)
        ])
    }
}

