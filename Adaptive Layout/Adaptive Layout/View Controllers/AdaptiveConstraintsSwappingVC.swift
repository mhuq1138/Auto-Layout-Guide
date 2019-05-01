//
//  AdaptiveConstraintsSwappingVC.swift
//  Adaptive Layout
//
//  Created by Mazharul Huq on 4/28/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class AdaptiveConstraintsSwappingVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    
    var verticalViews = [NSLayoutConstraint]()
    var horizontalViews = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        
        self.verticalViews = getVerticalConstraints()
        self.horizontalViews = getHorizontalConstraints()
        NSLayoutConstraint.activate(self.verticalViews)
    }
    
    func getVerticalConstraints()->[NSLayoutConstraint]{
        var array = [NSLayoutConstraint]()
        let safeArea = self.view.safeAreaLayoutGuide
        array.append(self.redView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 30.0))
        array.append(self.redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 50.0))
        array.append(self.redView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 200.0))
        
        array.append(self.blueView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 30.0))
        array.append(self.blueView.leadingAnchor.constraint(equalTo: self.redView.trailingAnchor,constant: 20.0))
        array.append(self.blueView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.blueView.heightAnchor.constraint(equalToConstant: 200.0))
        
        array.append(self.greenView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 30.0))
        array.append(self.greenView.leadingAnchor.constraint(equalTo: self.blueView.trailingAnchor,constant: 20.0))
        array.append(self.greenView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.greenView.heightAnchor.constraint(equalToConstant: 200.0))
        
        return array
    }
    
    func getHorizontalConstraints()->[NSLayoutConstraint]{
        var array = [NSLayoutConstraint]()
        let safeArea = self.view.safeAreaLayoutGuide
        array.append(self.redView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 30.0))
        array.append(self.redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 50.0))
        array.append(self.redView.widthAnchor.constraint(equalToConstant: 200.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 30.0))
        
        array.append(self.blueView.topAnchor.constraint(equalTo: self.redView.bottomAnchor,constant: 30.0))
        array.append(self.blueView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 50.0))
        array.append(self.blueView.widthAnchor.constraint(equalToConstant: 200.0))
        array.append(self.blueView.heightAnchor.constraint(equalToConstant: 30.0))
        
        array.append(self.greenView.topAnchor.constraint(equalTo: self.blueView.bottomAnchor,constant: 30.0))
        array.append(self.greenView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 50.0))
        array.append(self.greenView.widthAnchor.constraint(equalToConstant: 200.0))
        array.append(self.greenView.heightAnchor.constraint(equalToConstant: 30.0))
        
        return array
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        if self.traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.deactivate(verticalViews)
            NSLayoutConstraint.activate(horizontalViews)
        }
        else{
            NSLayoutConstraint.deactivate(horizontalViews)
            NSLayoutConstraint.activate(verticalViews)
        }
    }
}



