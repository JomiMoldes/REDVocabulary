//
// Created by MIGUEL MOLDES on 17/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation

struct REDConstants {
    struct Paths{
        static let USER_DATA_DIRECTORY : String = "/RED"
    }

    struct Progression {
        static let SUCCESSFUL_DAYS_IN_A_ROW : Int = 3
    }

    struct Time {
        static let SECOND = 3600
        static let MINUTE = SECOND * 60
        static let HOUR = MINUTE * 60
        static let DAY = HOUR * 24
    }
}
