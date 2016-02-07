//
// Created by MIGUEL MOLDES on 7/2/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDWordsFactory {

    func createWord(lng1:String,_ lng2:String)->REDWord{
        var word = REDWord();
        word.lng1 = lng1;
        word.lng2 = lng2;
        word.refresh(NSDate());
        return word;
    }
}
