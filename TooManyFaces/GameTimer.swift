//
//  GameTimer.swift
//  TooManyFaces
//
//  Created by Valliappa Chockalingam on 1/17/15.
//  Copyright (c) 2015 TeamZero. All rights reserved.
//

import Foundation

class GameTimer: NSObject {
    
    var timer = NSTimer()
    var timerRunning = false;
    var timeLimit: Double = 10.0
    var startTime = NSTimeInterval()
    var endTime = NSTimeInterval()
    var timeElapsed: NSTimeInterval {
        get {
            if (timerRunning) {
                
            } else {
                return endTime - startTime
            }
            return NSDate.timeIntervalSinceReferenceDate() - startTime
        }
    }
    
    func checkTime() {
        if timeElapsed > timeLimit {
            stop()
            timer.invalidate()
        }
    }
    
    func start() {
        
        startTime = NSDate.timeIntervalSinceReferenceDate()
        timerRunning = true;
        
        let timeInterval : NSTimeInterval = 0.0001
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: Selector("checkTime"), userInfo: nil, repeats: true)
        
    }
    
    func stop() {
        
        endTime = NSDate.timeIntervalSinceReferenceDate()
        timerRunning = false
    }
}
