//
//  SafeAreaInCodeVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/25/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class SafeAreaInCodeVC: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var button: UIButton!
    
    var constraintsNotUsingSafeArea:[NSLayoutConstraint]!
    var constraintsUsingSafeArea:[NSLayoutConstraint]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.isEnabled = false
        self.createConstraintsNotUsingSA()
        self.createConstraintsUsingSA()
        
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(self.constraintsNotUsingSafeArea)
    }
    
    func createConstraintsNotUsingSA(){
        var array:[NSLayoutConstraint] = []
        array.append(self.redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0))
        array.append(self.redView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0))
        array.append(self.redView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 200.0))
        self.constraintsNotUsingSafeArea = array
    }
    
    func createConstraintsUsingSA(){
        var array:[NSLayoutConstraint] = []
        let safeArea = self.view.safeAreaLayoutGuide
        array.append(self.redView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20.0))
        array.append(self.redView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0.0))
        array.append(self.redView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0.0))
        array.append(self.redView.heightAnchor.constraint(equalToConstant: 200.0))
        self.constraintsUsingSafeArea = array
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        let sw = sender as! UISwitch
        
        if sw.isOn{
            NSLayoutConstraint.deactivate(self.constraintsNotUsingSafeArea)
            NSLayoutConstraint.activate(self.constraintsUsingSafeArea)
            self.button.isEnabled = true
            self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
        else {
            NSLayoutConstraint.deactivate(self.constraintsUsingSafeArea)
            NSLayoutConstraint.activate(self.constraintsNotUsingSafeArea)
            self.button.isEnabled = false
        }
    }
    
    @IBAction func addExtraSafeAreaInsetTapped(_ sender: Any) {
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        self.button.isEnabled = false
    }
}

