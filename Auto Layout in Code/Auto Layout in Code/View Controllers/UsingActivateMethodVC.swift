//
//  UsingActivateMethodVC.swift
//  Auto Layout in Code
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class UsingActivateMethodVC: UIViewController {

    let redView = UIView()
    let blueView = UIView()
    let greenView = UIView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redView.backgroundColor = .red
        self.blueView.backgroundColor = .blue
        self.greenView.backgroundColor = .green
        self.label.text = "Hello from iOS!!"
        self.label.textColor = .white
        self.label.font = UIFont(name: "Arial", size: 20.0)
        
        
        self.view.addSubview(self.redView)
        self.redView.addSubview(self.blueView)
        self.redView.addSubview(self.greenView)
        self.blueView.addSubview(self.label)
        
        //Subviews do not convert autoresizing masks into constraints
        
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        activateConstraints()
    }
    
    func activateConstraints(){
        
        //Constraints positioning and sizing red view
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.redView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.redView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250.0),
            
            NSLayoutConstraint(item: self.redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 180.0)])
        
        //Constraints positioning and sizing blue view
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.blueView, attribute: .left, relatedBy: .equal, toItem: self.redView, attribute: .left, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.blueView, attribute: .top, relatedBy: .equal, toItem: self.redView, attribute: .top, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.blueView, attribute: .right, relatedBy: .equal, toItem: self.redView, attribute: .right, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.blueView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0)])
        
        //Constraints positioning label
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.label, attribute: .centerX, relatedBy: .equal, toItem: self.blueView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.label, attribute: .centerY, relatedBy: .equal, toItem: self.blueView, attribute: .centerY, multiplier: 1.0, constant: 0.0)])
        
        //Constraints positioning and sizing green view
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.greenView, attribute: .top, relatedBy: .equal, toItem: self.blueView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.greenView, attribute: .bottom, relatedBy: .equal, toItem: self.redView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.greenView, attribute: .right, relatedBy: .equal, toItem: self.redView, attribute: .right, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: self.blueView, attribute: .width, relatedBy: .equal, toItem: self.greenView, attribute: .width, multiplier: 3.0, constant: 0.0)
            ])
    }
}


