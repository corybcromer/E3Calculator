//
//  InfoViewController.swift
//  E3Calculator
//
//  Created by Cory Cromer on 5/27/19.
//  Copyright © 2019 BurningHearts. All rights reserved.
//

import Foundation
import SideMenu

class InfoViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func linkPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://e3compliance.com")! as URL, options: [:], completionHandler: nil)
    }
    
}
