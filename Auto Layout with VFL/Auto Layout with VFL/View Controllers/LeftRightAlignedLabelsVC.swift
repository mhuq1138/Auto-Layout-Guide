//
//  LeftRightAlignedLabelsVC.swift
//  Auto Layout with VFL
//
//  Created by Mazharul Huq on 4/22/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class LeftRightAlignedLabelsVC: UIViewController {
    
    @IBOutlet var leftLargeLabel: UILabel!
    @IBOutlet var rightLargeLabel: UILabel!
    @IBOutlet var leftMediumLabel: UILabel!
    @IBOutlet var rightMediumLabel: UILabel!
    @IBOutlet var leftSmallLabel: UILabel!
    @IBOutlet var rightSmallLabel: UILabel!
    
    private var constraintsArray:[NSLayoutConstraint] = []
    
    lazy var views:[String:Any] = {
        let dict:[String:Any]
        
        dict = ["leftLargeLabel": self.leftLargeLabel as Any,
                "leftMediumLabel": self.leftMediumLabel as Any,
                "leftSmallLabel": self.leftSmallLabel as Any,
                "rightLargeLabel": self.rightLargeLabel as Any,
                "rightMediumLabel": self.rightMediumLabel as Any,
                "rightSmallLabel": self.rightSmallLabel as Any
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
        
        self.leftLargeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leftMediumLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leftSmallLabel.translatesAutoresizingMaskIntoConstraints = false
        self.rightLargeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.rightMediumLabel.translatesAutoresizingMaskIntoConstraints = false
        self.rightSmallLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setConstraints(){
        let metrics = self.setMetrics()
        
        //Horizontal constraint for top left and right labels
        let labelsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftMargin-[leftLargeLabel]-(>=20)-[rightLargeLabel]-rightMargin-|", options: [], metrics: metrics, views: self.views)
        constraintsArray.append(contentsOf: labelsHorizontal)
        
        //Aligning left edge of left labels
        let leftLabelVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[leftLargeLabel]", options: [], metrics: metrics, views: self.views)
        constraintsArray.append(contentsOf: leftLabelVertical)
        
        let labelsVerticalLeft = NSLayoutConstraint.constraints(withVisualFormat: "V:[leftLargeLabel]-20-[leftMediumLabel]-20-[leftSmallLabel]", options: [.alignAllLeft], metrics: metrics, views: self.views)
        constraintsArray.append(contentsOf: labelsVerticalLeft)
        
        //Aligning right edge of right labels
        let rightLabelVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[rightLargeLabel]", options: [], metrics: metrics, views: self.views)
        constraintsArray.append(contentsOf: rightLabelVertical)
        
        let labelsVerticalRight = NSLayoutConstraint.constraints(withVisualFormat: "V:[rightLargeLabel]-20-[rightMediumLabel]-20-[rightSmallLabel]", options: [.alignAllRight], metrics: metrics, views: self.views)
        constraintsArray.append(contentsOf: labelsVerticalRight)
        
        NSLayoutConstraint.activate(constraintsArray)
        
    }
    
}

