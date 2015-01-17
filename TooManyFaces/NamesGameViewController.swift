//
//  NamesGameViewController.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/16/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class NamesGameViewController: UIViewController {

    let game = NamesGameModel()
    
    @IBOutlet weak var friendPhoto: UIImageView!
    
    @IBOutlet weak var friendName1: UIButton!

    @IBOutlet weak var friendName2: UIButton!
    
    @IBOutlet weak var friendName3: UIButton!
    
    @IBOutlet weak var friendName4: UIButton!
    
    func displayQuestion() {

        if let photo = game.questions.first?.photo {
            friendPhoto.image = photo
        }
        
        if let names = game.questions.first?.names {
            
            friendName1.setTitle(names.0, forState: UIControlState.Normal)
            friendName2.setTitle(names.1, forState: UIControlState.Normal)
            friendName3.setTitle(names.2, forState: UIControlState.Normal)
            friendName4.setTitle(names.3, forState: UIControlState.Normal)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

