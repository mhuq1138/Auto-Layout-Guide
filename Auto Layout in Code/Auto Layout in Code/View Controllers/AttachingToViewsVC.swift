//
//  AttachingToViewsVC.swift
//  Auto Layout in Code
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class AttachingToViewsVC: UIViewController {
    var redView = UIView()
    var blueView = UIView()
    var greenView = UIView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redView.backgroundColor = .red
        self.view.addSubview(self.redView)
        
        self.blueView.backgroundColor = .blue
        self.redView.addSubview(self.blueView)
        
        self.greenView.backgroundColor = .green
        self.redView.addSubview(self.greenView)
        
        self.label.text = "Hello World!"
        self.label.textColor = .white
        self.label.font = UIFont(name: "Arial", size: 20.0)
        self.blueView.addSubview(self.label)

        self.addConstraints()
    }
    
    func addConstraints(){
        
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        //Red view constraints
        
        self.view.addConstraints([
        NSLayoutConstraint(item: self.redView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 100),
        NSLayoutConstraint(item: self.redView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 60),
        NSLayoutConstraint(item: self.view!,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.redView,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 60)
        ])
        self.redView.addConstraint(
        NSLayoutConstraint(item: self.redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 200))
        
        
        //Blue view constraints
        self.redView.addConstraints([
            NSLayoutConstraint(item: self.redView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.blueView,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.redView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.blueView,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.redView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.blueView,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0)
            ])
        self.blueView.addConstraint(
            NSLayoutConstraint(item: self.blueView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 60))

        //Label constarints
        self.blueView.addConstraints([
            NSLayoutConstraint(item: self.blueView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self.label,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.blueView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.label,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0)
            ])

        //Green view cosntraints
        self.redView.addConstraints([
            NSLayoutConstraint(item: self.blueView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.greenView,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.redView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.greenView,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.redView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.greenView,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: self.redView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: self.greenView,
                               attribute: .width,
                               multiplier: 2,
                               constant: 0)
            ])
        
    }
}
