//
//  SettingsViewController.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, FBLoginViewDelegate {
    
    
    @IBOutlet weak var profilePictureView: FBProfilePictureView!
    
    @IBOutlet weak var loginView: FBLoginView!
    
    @IBOutlet weak var FBloginStatus: UILabel!
    
    @IBOutlet weak var FBUsername: UILabel!
    
    @IBOutlet weak var FBEmail: UILabel!
    
    func toggleHiddenState(shouldHide: Bool) {
        FBUsername.hidden = shouldHide
        FBEmail.hidden = shouldHide
        profilePictureView.hidden = shouldHide
        
        self.tabBarController?.tabBar.hidden = shouldHide
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView) {
        FBloginStatus.text = "You are logged in."
        toggleHiddenState(false)
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser) {
        
        println("\(user)")
        profilePictureView.profileID = user.objectID
        FBUsername.text = user.name
        FBEmail.text = user.objectForKey("email") as? String
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        FBloginStatus.text = "You are logged out."
        
        toggleHiddenState(true)
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError) {
        println("\(error.localizedDescription)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // hiding facebook info
        toggleHiddenState(true)
        FBloginStatus.text = ""
        
        loginView.readPermissions = ["public_profile", "email", "user_friends", "read_friendlists"]
        loginView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


