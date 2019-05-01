//
//  ImplicitAutoresizingConstraintsVC.swift
//  Auto Layout in Code
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ImplicitAutoresizingConstraintsVC: UIViewController {

    var redView:UIView!
    var blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redView = UIView(frame: CGRect(x: 50, y: 110, width: 200, height: 120))
        self.redView.backgroundColor = .red
        self.view.addSubview(self.redView)
        self.redView.autoresizingMask = [.flexibleRightMargin,.flexibleBottomMargin]
        
        self.blueView.backgroundColor = .blue
        self.view.addSubview(self.blueView)
        
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        
        //1
        self.view.addConstraint(
            NSLayoutConstraint(item: self.blueView ,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.redView,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 10)
        )
        //2
        self.view.addConstraint(
            NSLayoutConstraint(item: self.view!,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self.blueView,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 100)
        )
        //3
        blueView.addConstraint(
            NSLayoutConstraint(item: self.blueView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 250)
        )
        //4
        blueView.addConstraint(
            NSLayoutConstraint(item: self.blueView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 150)
        )
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let arr1 = self.redView.constraintsAffectingLayout(for: .horizontal)
        let arr2 = self.redView.constraintsAffectingLayout(for: .vertical)
        print(arr1)
        print("")
        print(arr2)
    }
    
    
}
