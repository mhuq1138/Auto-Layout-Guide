//
//  PreservingSuperviewMarginsVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/26/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class PreservingSuperviewMarginsVC: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    var marginFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.blueView.topAnchor.constraint(equalTo: self.redView.topAnchor,constant:8.0),
            self.blueView.rightAnchor.constraint(equalTo: self.redView.rightAnchor,constant:-8.0),
            self.blueView.bottomAnchor.constraint(equalTo: self.redView.bottomAnchor,constant:-8.0),
            self.blueView.leftAnchor.constraint(equalTo: self.redView.leftAnchor,constant:8.0)
            ])
        
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.greenView.topAnchor.constraint(equalTo: self.blueView.layoutMarginsGuide.topAnchor),
            self.greenView.rightAnchor.constraint(equalTo: self.blueView.layoutMarginsGuide.rightAnchor),
            self.greenView.bottomAnchor.constraint(equalTo: self.blueView.layoutMarginsGuide.bottomAnchor),
            self.greenView.leftAnchor.constraint(equalTo: self.blueView.layoutMarginsGuide.leftAnchor)
            ])
    }
    
    @IBAction func changeMarginsTapped(_ sender: Any) {
        if self.marginFlag {
            self.redView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 32, leading: 24, bottom: 24, trailing: 40)
            self.marginFlag = false
        }
        else{
            self.redView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            self.marginFlag = true
        }
        print("Before")
        self.blueView.preservesSuperviewLayoutMargins = false
        print(self.blueView.layoutMargins)
        print("After")
        self.blueView.preservesSuperviewLayoutMargins = true
        print(self.blueView.layoutMargins)
    }
}
