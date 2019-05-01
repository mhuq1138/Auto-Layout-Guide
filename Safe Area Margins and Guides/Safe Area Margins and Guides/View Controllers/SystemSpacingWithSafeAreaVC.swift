//
//  SystemSpacingWithSafeAreaVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/25/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class SystemSpacingWithSafeAreaVC: UIViewController {
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
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.redView.topAnchor.constraint(equalTo:safeArea.topAnchor).isActive = true
        self.redView.leadingAnchor.constraint(equalTo:safeArea.leadingAnchor).isActive = true
        self.redView.bottomAnchor.constraint(equalTo:safeArea.bottomAnchor).isActive = true
        self.redView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        self.blueView.topAnchor.constraint(equalTo:safeArea.topAnchor).isActive = true
        self.blueView.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor).isActive = true
        self.blueView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        self.blueView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.redView.trailingAnchor, multiplier: 1.0).isActive = true
        
        self.greenView.topAnchor.constraint(equalToSystemSpacingBelow: self.blueView.bottomAnchor, multiplier: 1.0).isActive = true
        self.greenView.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor).isActive = true
        self.greenView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        self.greenView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.redView.trailingAnchor, multiplier: 1.0).isActive = true
        
    }
}
