//
//  NamesGameModel.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class NamesGameModel: NSObject {
    
    func getNewQuestion() -> NamesQuestion? {
        let numberOfQuestions = questions.count
        if numberOfQuestions > 0 {
            return questions[random() % numberOfQuestions]
        } else {
            return nil
        }
    }
    
    let question1 = NamesQuestion(thePhoto: UIImage(named: "valli")!, theNames: ("Kyle", "Valli", "Maxim", "Justin"), correctName: "Justin")
    let question2 = NamesQuestion(thePhoto: UIImage(named: "squirrel")!, theNames: ("cat", "dog", "penguin", "squirrel"), correctName: "squirrel")
    
    var questions: [NamesQuestion] {
        get {
            return [question1, question2]
        }
    }
    
}


