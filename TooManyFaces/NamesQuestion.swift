//
//  NamesQuestion.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class NamesQuestion: NSObject {
    
    var photo: UIImage
    var names: (String, String, String, String)
    
    var correct: String
    
    required init(thePhoto: UIImage!, theNames: (String, String, String, String), correctName: String) {
        photo = thePhoto
        names = theNames
        correct = correctName
    }
    
    func isCorrectName(nameSelected: String) -> Bool {
        return nameSelected == correct
    }
}
