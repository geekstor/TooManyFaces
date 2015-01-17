//
//  SettingsViewController.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var profilePictureView: FBProfilePictureView!
    
    @IBOutlet weak var loginView: FBLoginView!
    
    @IBOutlet weak var FBloginStatus: UILabel!
    
    @IBOutlet weak var FBUsername: UILabel!
    
    @IBOutlet weak var FBEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


