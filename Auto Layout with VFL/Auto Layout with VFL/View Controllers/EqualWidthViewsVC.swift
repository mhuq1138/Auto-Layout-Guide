//
//  EqualWidthViewsVC.swift
//  Auto Layout with VFL
//
//  Created by Mazharul Huq on 4/23/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class EqualWidthViewsVC: UIViewController {
    @IBOutlet var greenView: UIView!
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    
    private var constraintsArray:[NSLayoutConstraint] = []
    
    lazy var views:[String:Any] = {
        let dict:[String:Any]
        
        dict = [
                "greenView": self.greenView as Any,
                "redView": self.redView as Any,
                "blueView": self.blueView as Any
        ]
        return dict
    }()
    
    func setMetrics()->[String:Any]{
        let dict:[String:Any]
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : 20
        let rightMargin = newInsets.right > 0 ? newInsets.right : 20
        let topMargin = newInsets.top > 0 ? newInsets.top + 20 : 100
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : 20
        
        dict = [
            "leftMargin": leftMargin,
            "topMargin": topMargin,
            "rightMargin": rightMargin,
            "bottomMargin": bottomMargin
        ]
        return dict
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.deactivateImplicitConstraints()
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        if !self.constraintsArray.isEmpty{
            NSLayoutConstraint.deactivate(self.constraintsArray)
            self.constraintsArray.removeAll()
        }
        print("called")
        setConstraints()
    }
    
    func deactivateImplicitConstraints(){
        
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setConstraints(){
        let metrics = self.setMetrics()
        
        let blueViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-80-[blueView]-80-|", options: [], metrics:metrics ,views: self.views)
        constraintsArray.append(contentsOf: blueViewHorizontal)
       
        let redViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[redView]", options: [], metrics: metrics,views: self.views)
        constraintsArray.append(contentsOf: redViewHorizontal)
        
        let greenViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[greenView]", options: [], metrics: metrics,views: self.views)
        constraintsArray.append(contentsOf: greenViewHorizontal)
        
        let blueViewVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:[blueView(30)]", options: [], metrics: metrics,views: self.views)
        constraintsArray.append(contentsOf: blueViewVertical)
        
        let viewsVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[greenView(30)]-20-[redView(30)]-20-[blueView]", options: [.alignAllCenterX,.alignAllLeading], metrics: metrics,views: self.views)
        constraintsArray.append(contentsOf: viewsVertical)
        
        NSLayoutConstraint.activate(constraintsArray)
        
    }
    
}

