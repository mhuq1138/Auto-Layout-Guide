//
//  ViewController.swift
//  Manual Layout
//
//  Created by Mazharul Huq on 4/5/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redView = MyView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let width = self.view.bounds.width
        self.redView.frame.size.width = 0.60*width
        self.redView.frame.size.height = 0.60*width
        self.redView.backgroundColor = .red
        self.view.addSubview(self.redView)
    }
    
    override func viewWillLayoutSubviews() {
        
        self.redView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        print(self.redView.frame)   
    }
}

