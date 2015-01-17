//
//  GameSettingsViewController.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import Foundation

let AUTH_URL = "https://api.instagram.com/oauth/authorize/"
let TOKEN_URL = "https://api.instagram.com/oauth/access_token/"
let API_URL = "https://api.instagram.com/v1/users/"
let CLIENT_ID = "5ea8c033d1174f4aa25114281d5b1497"
let CLIENT_SECRET = "8edcb15d96b5429f8cbbda9ce5bc9236"
let REDIRECT_URI = "http://umich.edu/~maximal/"
let SCOPE = "comments+relationships+likes"

class GameSettingsViewController: UIViewController, UIWebViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}