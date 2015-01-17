//
//  NamesGameViewController.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/16/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import UIKit

class NamesGameViewController: UIViewController {
    
    
    // Model
    let game = NamesGameModel()
    var score = 0
    var totalIncorrect = 0
    var currentQuestion: NamesQuestion?
    
    var timeLimit: NSTimeInterval = 10
    var timer = GameTimer()
    
    enum GameStatus {
        case Start
        case InProgress
        case Complete
    }
    
    // TODO: overrite setter to update view
    var gameStatus = GameStatus.Start
    
    // Question view outlets
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var friendName1: UIButton!
    @IBOutlet weak var friendName2: UIButton!
    @IBOutlet weak var friendName3: UIButton!
    @IBOutlet weak var friendName4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Start view actions
    @IBAction func touchStartButton(sender: UIButton) {
        
        resetGame()
    }
    
    // Question view actions
    @IBAction func selectOption1(sender: UIButton) {
        
        if let option = sender.titleLabel?.text {
            checkOptionSelectionForButton(sender)
        }
    }
    @IBAction func selectOption2(sender: UIButton) {
        
        if let option = sender.titleLabel?.text {
            checkOptionSelectionForButton(sender)
        }
    }
    @IBAction func selectOption3(sender: UIButton) {
        
        if let option = sender.titleLabel?.text {
            checkOptionSelectionForButton(sender)
        }
    }
    @IBAction func selectOption4(sender: UIButton) {
        
        if let option = sender.titleLabel?.text {
            checkOptionSelectionForButton(sender)
        }
    }
    
    // Game function
    
    func resetGame() {
        gameStatus = GameStatus.InProgress
        displayQuestion()
        updateView()
        
        // start timer
        timer.start()
    }
    
    func completedQuestion()
    {
        //gameStatus = GameStatus.Complete
        //updateView()
        displayQuestion()
        println("\(timer.timeElapsed)")
    }
    
    func checkOptionSelectionForButton(sender: UIButton) {

        if let name = sender.titleLabel?.text {
            
            if (name == currentQuestion?.correct) {
                let greenColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
                sender.setTitleColor(greenColor, forState: UIControlState.Normal)
                friendName1.enabled = false
                friendName2.enabled = false
                friendName3.enabled = false
                friendName4.enabled = false
                let timeInterval : NSTimeInterval = 0.5
                var timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector:  Selector("completedQuestion"), userInfo: nil, repeats: false)
                if(totalIncorrect == 0) {
                    score += 5
                }
                else if(totalIncorrect == 1) {
                    score += 3
                }
                else if(totalIncorrect == 2) {
                    score += 2
                }
                else if(totalIncorrect == 3) {
                    score += 1
                }
                totalIncorrect = 0
            } else {
                let redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
                sender.setTitleColor(redColor, forState: UIControlState.Normal)
                sender.enabled = false
                totalIncorrect += 1
            }
        }
    }
    
    
    // Switches between 3 views
    func updateView() {
        
        var viewTag: Int?
        switch gameStatus {
        case .Start:
            viewTag = 0
        case .InProgress:
            viewTag = 1
        case .Complete:
            viewTag = 2
            
        }
        
        if let tag = viewTag {
            
            for gameView in view.subviews  {
                if let gameViewUIView = gameView as? UIView {
                    gameViewUIView.hidden = (gameViewUIView.tag != tag)
                }
            }
        }
        
        
    }
    
    
    // End view actions
    @IBAction func touchResetButton(sender: UIButton) {
        resetGame()
    }
    
    func resetAnswerOptions() {
        
        friendName1.setTitle("", forState: UIControlState.Normal)
        friendName2.setTitle("", forState: UIControlState.Normal)
        friendName3.setTitle("", forState: UIControlState.Normal)
        friendName4.setTitle("", forState: UIControlState.Normal)
        
        friendName1.enabled = true
        friendName2.enabled = true
        friendName3.enabled = true
        friendName4.enabled = true
        
        // clear options
        if let defaultColor = friendName1.tintColor {
            
            friendName1.setTitleColor(defaultColor, forState: UIControlState.Normal)
            friendName2.setTitleColor(defaultColor, forState: UIControlState.Normal)
            friendName3.setTitleColor(defaultColor, forState: UIControlState.Normal)
            friendName4.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
    }
    
    func displayQuestion() {
        
        
        resetAnswerOptions()

        if let question = game.getNewQuestion() {
            currentQuestion = question
            if let photo = currentQuestion?.photo {
                friendPhoto.image = photo
            }
            
            if let names = currentQuestion?.names {
                
                friendName1.setTitle(names.0, forState: UIControlState.Normal)
                friendName2.setTitle(names.1, forState: UIControlState.Normal)
                friendName3.setTitle(names.2, forState: UIControlState.Normal)
                friendName4.setTitle(names.3, forState: UIControlState.Normal)
                
                
            }
        }
        
    }
    
    
    
    func endGame() {
        gameStatus = GameStatus.Complete
        updateView()
        scoreLabel.text = "Score: \(score)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "endGame", name: timerCompleteNotificationKey, object: nil)
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

