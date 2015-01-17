//
//  NamesGameModel.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class NamesGameModel: NSObject {

    
    
    let question1 = NamesQuestion(thePhoto: UIImage(named: "valli")!, theNames: ("Kyle", "Valli", "Maxim", "Justin"), correctName: "Justin")
    
    var questions: [NamesQuestion] {
        get {
            return [question1]
        }
    }
    
}


