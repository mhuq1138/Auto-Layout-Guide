//
//  SystemSpacingVC.swift
//  Auto Layout with Anchor
//
//  Created by Mazharul Huq on 4/24/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class SystemSpacingVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.disableAutorresizing()
        self.createConstraints()
    }
    
    func disableAutorresizing(){
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createConstraints(){
        self.redView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        self.redView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        self.redView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
        self.redView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        self.blueView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        self.blueView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true
        self.blueView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        self.blueView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.redView.trailingAnchor, multiplier: 1.0).isActive = true
        
        self.greenView.topAnchor.constraint(equalToSystemSpacingBelow: self.blueView.bottomAnchor, multiplier: 1.0).isActive = true
        self.greenView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true
        self.greenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.greenView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.redView.trailingAnchor, multiplier: 1.0).isActive = true
        
    }
}
