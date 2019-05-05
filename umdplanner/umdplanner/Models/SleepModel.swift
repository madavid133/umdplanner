//
//  SleepModel.swift
//  umdplanner
//
//  Created by David Ma on 5/5/19.
//  Copyright © 2019 group42. All rights reserved.
//

import Foundation

class sleepTracker {
    
    // Sleeping time, movementCount, get up time, sleep duration
    var sleepTuple: (NSDate, Int, NSDate, Int)
    var movementCount : Int
    
    init () {
        movementCount = 0
        sleepTuple = (NSDate.init(), movementCount, NSDate.init(), 0)
    }
    
    // set sleep time
    func setSleep() {
        
    }
    
    //set get up time
    func setGetUp() {
        
    }
    
    // get sleep time
    func getSleep() -> NSDate {
        return sleepTuple.0
    }
    
    // get get up time
    func getGetUp() -> NSDate {
        return sleepTuple.2
    }
    
    // get movement count
    func getMovementCount() -> Int {
        return sleepTuple.3
    }
    
    // calculate duration of sleep and get up
    func calculateDuration(d1 : NSDate, d2 : NSDate) -> Int{
        return 0
    }
}

