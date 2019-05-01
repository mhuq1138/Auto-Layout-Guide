//
//  ViewHierarchyVC.swift
//  Auto Layout with VFL
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewHierarchyVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    
    var allConstraints:[NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        
        let d:[String:Any] = ["main":self.view!, "redView":self.redView!,"blueView":self.blueView!,"greenView":self.greenView!]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[main]-[redView(200)]", options: .alignAllCenterX, metrics: nil, views: d)
        self.allConstraints.append(contentsOf: verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[main]-[redView(250)]", options: [.alignAllCenterY], metrics: nil, views: d)
        self.allConstraints.append(contentsOf: horizontalConstraints)
        
        let verticalConstraints1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|[blueView(20)][greenView]|", options: [], metrics: nil, views: d)
        self.allConstraints.append(contentsOf: verticalConstraints1)
        
        let horizontalConstraints1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[blueView]|", options: [], metrics: nil, views: d)
        self.allConstraints.append(contentsOf: horizontalConstraints1)
        
        let horizontalConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[greenView(50)]", options: [], metrics: nil, views: d)
        self.allConstraints.append(contentsOf: horizontalConstraints2)
        
        NSLayoutConstraint.activate(self.allConstraints)
    }
}


