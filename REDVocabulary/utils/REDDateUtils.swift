//
// Created by MIGUEL MOLDES on 25/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDDateUtils {

    func getMidnightFromDate(date : NSDate) -> NSDate {
        let calendar : NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components([.Year, .Month, .Day], fromDate: date)
        let todayAtOO = calendar.dateFromComponents(components)
        return todayAtOO!
    }

    func getDateAddingDaysToDate(date : NSDate, daysToAdd : Int) -> NSDate {
        let calendar : NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
        let components : NSDateComponents = NSDateComponents()
        components.day = daysToAdd

        let newDate : NSDate? = calendar.dateByAddingComponents(components, toDate: date, options: NSCalendarOptions(rawValue: 0))
        return newDate!
    }

    func getDateFromTimestamp(time : NSTimeInterval) -> NSDate {
        var date : NSDate = NSDate()
        date = date.dateByAddingTimeInterval(time)
        return date
    }

    func isSameDay(date1:NSDate, _ date2:NSDate) -> Bool {
        let firstDate = getMidnightFromDate(date1)
        let secondDate = getMidnightFromDate(date2)
        if firstDate.isEqualToDate(secondDate) {
            return true
        }
        return false
    }

}
