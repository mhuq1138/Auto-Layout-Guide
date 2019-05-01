//
//  AligningFirstBaselineVC.swift
//  Auto Layout with Anchor
//
//  Created by Mazharul Huq on 4/24/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class AligningFirstBaselineVC: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.disableAutorresizing()
        self.createConstraints()
    }
    
    func disableAutorresizing(){
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.textField.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func createConstraints(){
        self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40.0).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10.0).isActive = true
        self.textField.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        self.textField.firstBaselineAnchor.constraint(equalTo: self.label.firstBaselineAnchor).isActive = true
    }
}
