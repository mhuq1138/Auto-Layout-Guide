//
//  ContentHuggingAndCompressionVC.swift
//  Safe Area Margins and Guides
//
//  Created by Mazharul Huq on 4/26/19.
//  Copyright © 2019 Mazharul Huq. All rights reserved.
//

import UIKit

class ContentHuggingAndCompressionVC: UIViewController {

    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var brownLabel: UILabel!
    @IBOutlet var orangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func expandTapped(_ sender: Any) {
        self.blueLabel.text = self.blueLabel.text! + "XXX"
        self.redLabel.text = self.redLabel.text! + "XXX"
        self.orangeLabel.text = self.orangeLabel.text! + "XXX"
        self.brownLabel.text = self.brownLabel.text! + "XXX"
    }

}
