//
//  ConstraintsAsObjectsVC.swift
//  Auto Layout with Anchor
//
//  Created by Mazharul Huq on 4/24/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ConstraintsAsObjectsVC: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    
    var verticalBeam = [NSLayoutConstraint]()//Constraints for vertical beam
    var horizontalBeam = [NSLayoutConstraint]()//Constraints for horizonal beam
    var verticalFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        
        self.verticalBeam = getVerticalConstraints()
        self.horizontalBeam = getHorizontalConstraints()
        
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        NSLayoutConstraint.activate(self.verticalBeam)
    }
    
    func getVerticalConstraints()->[NSLayoutConstraint]{
        var array = [NSLayoutConstraint]()
        //Constraints for the red view
        array.append(self.redView.topAnchor.constraint(equalTo: self.button.bottomAnchor,constant: 30.0))
        array.append(self.redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50.0))
        array.append(self.redView.widthAnchor.constraint(equalToConstant: 200.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 30.0))
        
        //Constraints for blue view
        array.append(self.blueView.topAnchor.constraint(equalTo: self.redView.bottomAnchor,constant: 0.0))
        array.append(self.blueView.centerXAnchor.constraint(equalTo: self.redView.centerXAnchor, constant: 0.0))
        array.append(self.blueView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.blueView.heightAnchor.constraint(equalToConstant: 100.0))
        array.append(self.blueView.bottomAnchor.constraint(equalTo: self.greenView.topAnchor, constant: 0.0))
        
        //Constraints for green view
        array.append(self.greenView.centerXAnchor.constraint(equalTo: self.redView.centerXAnchor))
        array.append(self.greenView.widthAnchor.constraint(equalToConstant: 200.0))
        array.append(self.greenView.heightAnchor.constraint(equalToConstant: 30.0))
        
        return array
    }
    
    func getHorizontalConstraints()->[NSLayoutConstraint]{
        var array = [NSLayoutConstraint]()
        
        //Constraints for the red view
        array.append(self.redView.topAnchor.constraint(equalTo: self.button.bottomAnchor,constant: 30.0))
        array.append(self.redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50.0))
        array.append(self.redView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 200.0))
        
        //Constraints for blue view
        array.append(self.blueView.leadingAnchor.constraint(equalTo: self.redView.trailingAnchor,constant: 0.0))
        array.append(self.blueView.centerYAnchor.constraint(equalTo: self.redView.centerYAnchor, constant: 0.0))
        array.append(self.blueView.widthAnchor.constraint(equalToConstant: 100.0))
        array.append(self.blueView.heightAnchor.constraint(equalToConstant: 30.0))
        array.append(self.blueView.trailingAnchor.constraint(equalTo: self.greenView.leadingAnchor, constant: 0.0))
        
        //Constraints for green view
        array.append(self.greenView.centerYAnchor.constraint(equalTo: self.redView.centerYAnchor))
        array.append(self.greenView.widthAnchor.constraint(equalToConstant: 30.0))
        array.append(self.greenView.heightAnchor.constraint(equalToConstant: 200.0))
        
        return array
    }
    
    
    @IBAction func rotateBeamTapped(_ sender: Any) {
        if self.verticalFlag{
            NSLayoutConstraint.deactivate(self.verticalBeam)
            NSLayoutConstraint.activate(self.horizontalBeam)
            self.verticalFlag = false
        }
        else{
            NSLayoutConstraint.deactivate(self.horizontalBeam)
            NSLayoutConstraint.activate(self.verticalBeam)
            self.verticalFlag = true
        }
    }
}
