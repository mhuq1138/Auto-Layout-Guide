//
//  AdaptiveViewHierarchyInCodeVC.swift
//  Adaptive Layout
//
//  Created by Mazharul Huq on 4/28/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class AdaptiveViewHierarchyInCodeVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var orangeView: UIView!
    @IBOutlet var label: UILabel!
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var orangeTopConstraint: NSLayoutConstraint!
    @IBOutlet var redViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet var redViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var orangeViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var labelWidthConstraint: NSLayoutConstraint!
    
    var topConstraint: NSLayoutConstraint!
    var orangeBottomConstraint:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topConstraint = self.redView.topAnchor.constraint(equalTo: self.label.bottomAnchor,constant:10)
        self.orangeBottomConstraint = self.redView.bottomAnchor.constraint(equalTo: self.orangeView.bottomAnchor)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        let tc = self.traitCollection
        if tc.verticalSizeClass == .compact {
            NSLayoutConstraint.deactivate([self.bottomConstraint])
            NSLayoutConstraint.deactivate([self.orangeTopConstraint])
            NSLayoutConstraint.activate([self.topConstraint])
            NSLayoutConstraint.activate([self.orangeBottomConstraint])
        }
        else{
            if tc.horizontalSizeClass == .regular{
                self.redViewWidthConstraint.constant = 500
                self.redViewHeightConstraint.constant = 360
                self.orangeViewHeightConstraint.constant = 80
                self.labelWidthConstraint.constant = 500
            }
            NSLayoutConstraint.deactivate([self.topConstraint])
            NSLayoutConstraint.deactivate([self.orangeBottomConstraint])
            NSLayoutConstraint.activate([self.bottomConstraint])
            NSLayoutConstraint.activate([self.orangeTopConstraint])
        }
    }
}




