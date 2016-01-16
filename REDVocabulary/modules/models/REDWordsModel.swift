//
// Created by MIGUEL MOLDES on 10/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDWordsModel {
    static let sharedInstance = REDWordsModel();

    var currentFileName : String = ""
    var principalLanguage : String = ""
    var secondaryLanguage : String = ""

    var words : NSMutableArray = NSMutableArray();
    var listForToday : NSMutableArray = NSMutableArray();
    var wordsByIndex : NSMutableDictionary = NSMutableDictionary();
    var playing : Bool = false;
    var daysInARow : Int = 0;
    var currentIndex : Int = 0;

    private init(){


    }

    func getWordsForSaving() -> NSMutableDictionary {
        var dic : NSMutableDictionary = NSMutableDictionary();
        var wordsArr : NSMutableArray = NSMutableArray();

        var i : Int
        for (i = 0; i < self.words.count; ++i) {
//            RPWord *word = self.words[i];
//            NSLog(word.toDelete ? @"Yes" : @"No");
//            if (word.toDelete) {
//                [self.listForToday removeObject:word];
//                [self.words removeObject:word];
//                i--;
//                continue;
//            }
//            NSMutableDictionary *wordDic = [[NSMutableDictionary alloc] init];
//            wordDic[@"lng1"] = word.lng1;
//            wordDic[@"lng2"] = word.lng2;
//            wordDic[@"lastShown"] = word.lastShown;
//            wordDic[@"frequency"] = word.frequency;
//            wordDic[@"successful"] = word.successful;
//
//            [wordsArr addObject:wordDic];
        }
        dic["words"] = wordsArr;

        return dic;
    }
}
