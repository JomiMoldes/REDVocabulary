//
// Created by MIGUEL MOLDES on 25/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDWord {
    var lng1 : String = ""
    var lng2 : String = ""
    var frequency : Int = 0
    var lastShown : NSTimeInterval = 0
    var successful : Int = 0
    var daysToPublish : NSTimeInterval = 0
    var toDelete : Bool = false

    func refresh(date : NSDate){
        if self.lastShown == 0{
            refreshValues()
            return
        }
        if !stillValid(date) {
            penalize(date)
        }
    }

    func answerCorrect(date : NSDate, withDaysInARow daysInARow : Int) {
        if isSameDate(date) {
            self.lastShown = date.timeIntervalSince1970
            return
        }
        self.lastShown = date.timeIntervalSince1970

        let sum = self.successful + 1

        self.successful = sum

        var newFrequency = self.frequency

        let decrease : Bool = sum >= daysInARow

        if decrease {
            newFrequency += 1
            self.frequency = 0
        }
        self.frequency = newFrequency

    }

    func isSameDate(date : NSDate) -> Bool {
        let utils = REDDateUtils()
        let newDate : NSDate = utils.getDateFromTimestamp(self.lastShown)
        if utils.isSameDay(newDate, date) {
            return true
        }
        return false
    }

    func isShownInAdvance(date : NSDate) -> Bool {
        let utils = REDDateUtils()
        let lastDateShown : NSDate = utils.getDateFromTimestamp(self.lastShown)
        let nextDate : NSDate = utils.getDateAddingDaysToDate(lastDateShown, daysToAdd:self.frequency)

        if utils.isSameDay(nextDate, date) {
            return false
        }else if date.timeIntervalSinceDate(nextDate) > 0 {
            return false
        }
        return true
    }

    func answerIncorrect(date : NSDate) {
        refreshValues()
    }

    func refreshValues() {
        self.successful = 0;
        self.lastShown = 0;
        self.frequency = 0;
    }

    func stillValid(date: NSDate) -> Bool{
        let dateUtils : REDDateUtils = REDDateUtils()
        let daysAgo : NSDate = dateUtils.getDateAddingDaysToDate(date, daysToAdd:-frequency)
        let toCompare :NSDate = dateUtils.getMidnightFromDate(daysAgo)
        let lastShownDate : NSDate = dateUtils.getDateFromTimestamp(self.lastShown)
        if toCompare.compare(lastShownDate) == NSComparisonResult.OrderedAscending {
            return true
        }
        return false
    }

    func penalize(date : NSDate){
        let dateUtils : REDDateUtils = REDDateUtils()
        let lastShownDate : NSDate = dateUtils.getDateFromTimestamp(self.lastShown)
        let whenSholdBeShown : NSDate = dateUtils.getDateAddingDaysToDate(lastShownDate, daysToAdd:self.frequency)
        let secondsBetween : NSTimeInterval = date.timeIntervalSinceDate(whenSholdBeShown)
        let seconds : Int = Int(secondsBetween)

        let numberOfDays : Int = seconds / 86400

        let globalFreq : Int = REDConstants.Progression.SUCCESSFUL_DAYS_IN_A_ROW

        if numberOfDays > (self.frequency * globalFreq) {
            refreshValues()
        }
        if self.successful > 0 {
            self.successful = self.successful - 1
        }else if self.frequency > 1 {
            self.frequency = self.frequency - 1
            self.successful = globalFreq - 1
        }else {
            refreshValues()
        }


    }

}
