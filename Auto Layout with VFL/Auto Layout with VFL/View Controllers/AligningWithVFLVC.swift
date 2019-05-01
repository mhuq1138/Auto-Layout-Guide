//
//  AligningWithVFLVC.swift
//  Auto Layout with VFL
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class AligningWithVFLVC: UIViewController {
    @IBOutlet var star: UIImageView!
    @IBOutlet var redView: UIView!
    @IBOutlet var label: UILabel!
    
    private var constraintsArray:[NSLayoutConstraint] = []
    
    lazy var views:[String:Any] = {
        let dict:[String:Any]
        dict = ["star": self.star as Any,
                "redView": self.redView as Any,
                "label":self.label as Any
        ]
        return dict
    }()
    
    func setMetrics()->[String:Any]{
        let dict:[String:Any]
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : 10
        let rightMargin = newInsets.right > 0 ? newInsets.right : 10
        let topMargin = newInsets.top > 0 ? newInsets.top + 20 : 100
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : 10
        
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
        self.setConstraints()
    }
    
    func deactivateImplicitConstraints(){
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.star.translatesAutoresizingMaskIntoConstraints = false
        self.redView.translatesAutoresizingMaskIntoConstraints =
        false
    }
    
    func setConstraints(){
        let metrics = self.setMetrics()
        /*
        let starVertical = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-100-[star]", options: [],metrics: nil, views: self.views)
        constraintsArray.append(contentsOf: starVertical)
        
        let labelVertical = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-100-[label]", options: [], metrics: nil,
                                        views: self.views)
        constraintsArray.append(contentsOf: labelVertical)
       */
        let redViewVertical = NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-topMargin-[redView(40)]", options: [], metrics:
            metrics, views: self.views)
        constraintsArray.append(contentsOf: redViewVertical)
        
        let topHorizontal = NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-leftMargin-[star]-20-[label]-20-[redView]-rightMargin-|", options: [.alignAllCenterY], metrics:
            metrics, views: self.views)
        constraintsArray.append(contentsOf: topHorizontal)
        NSLayoutConstraint.activate(constraintsArray)
    }

}
