//
//  StackViewInCodeVC.swift
//  Stack View
//
//  Created by Mazharul Huq on 4/27/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class StackViewInCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var views = [UIView(),UIView(),UIView(),UIView()]
        views[0].backgroundColor = .red
        views[1].backgroundColor = .blue
        views[2].backgroundColor = .green
        views[3].backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            views[0].heightAnchor.constraint(equalToConstant: 40.0),
            views[1].heightAnchor.constraint(equalToConstant: 40.0),
            views[2].heightAnchor.constraint(equalToConstant: 40.0),
            views[3].heightAnchor.constraint(equalToConstant: 40.0)
            ])
        
        let stackView = UIStackView(arrangedSubviews: views)
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:safeGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo:safeGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo:safeGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo:safeGuide.bottomAnchor)
            ])
    }
}

