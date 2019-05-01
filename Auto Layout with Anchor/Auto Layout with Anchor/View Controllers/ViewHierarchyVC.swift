//
//  ViewHierarchyVC.swift
//  Auto Layout with Anchor
//
//  Created by Mazharul Huq on 4/23/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewHierarchyVC: UIViewController {

    var redView = UIView()
    var blueView = UIView()
    var greenView = UIView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createHierarchy()
        self.disableAutoresizing()
        self.addConstraints()
    }
    
    func createHierarchy(){
        self.redView.backgroundColor = .red
        view.addSubview(self.redView)
        
        self.label.text = "Hello World!"
        self.label.textColor = .white
        self.label.font = UIFont(name: "Arial", size: 20.0)
        self.blueView.addSubview(self.label)
        
        self.blueView.backgroundColor = .blue
        self.redView.addSubview(self.blueView)
        
        self.greenView.backgroundColor = .green
        self.redView.addSubview(self.greenView)
    }
    
    func disableAutoresizing(){
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addConstraints(){
        
        //Red view constraints
        NSLayoutConstraint.activate([
            self.redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.redView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.redView.widthAnchor.constraint(equalToConstant: 250),
            self.redView.heightAnchor.constraint(equalToConstant: 180)
            ])
        
        //Blue view constraints
        NSLayoutConstraint.activate([
            self.blueView.topAnchor.constraint(equalTo: self.redView.topAnchor),
            self.blueView.leadingAnchor.constraint(equalTo: self.redView.leadingAnchor),
            self.blueView.trailingAnchor.constraint(equalTo: self.redView.trailingAnchor),
            self.blueView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        //Label constarints
       label.centerXAnchor.constraint(equalTo:  self.blueView.centerXAnchor).isActive = true
       label.centerYAnchor.constraint(equalTo: self.blueView.centerYAnchor).isActive = true
        
        //Green view constraints
        NSLayoutConstraint.activate([
            self.greenView.topAnchor.constraint(equalTo: self.blueView.bottomAnchor),
            self.greenView.trailingAnchor.constraint(equalTo: self.redView.trailingAnchor),
            self.greenView.bottomAnchor.constraint(equalTo: self.redView.bottomAnchor),
            self.redView.widthAnchor.constraint(equalTo: self.greenView.widthAnchor, multiplier: 2.0)
            ])
    }
    
}

