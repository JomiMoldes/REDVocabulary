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

    func setupWords(dic:NSDictionary){
        let words = dic["words"] as! NSArray;
        for(var i = 0; i < words.count; i++){
            let element = words[i] as! NSDictionary;
            let word : REDWord = REDWord();
            word.lng1 = element["lng1"] as! String;
            word.lng2 = element["lng2"] as! String;
            word.lastShown = element["lastShown"] as! NSTimeInterval;
            word.frequency = element["frequency"] as! NSInteger;
            word.successful = element["successful"] as! NSInteger;
            word.refresh(NSDate());
            addWord(word);
        }

    }

    func addWord(word:REDWord){
        if(!self.words.containsObject(word)){
            self.words.addObject(word)
            print("word added", word.lng1);
        }
    }

    func getWordsForSaving() -> NSMutableDictionary {
        let dic : NSMutableDictionary = NSMutableDictionary();
        let wordsArr : NSMutableArray = NSMutableArray();

        var i : Int
        for (i = 0; i < self.words.count; ++i) {
            let word : REDWord = self.words[i] as! REDWord;
            var wordDic : NSMutableDictionary = NSMutableDictionary();
            wordDic["lng1"] = word.lng1;
            wordDic["lng2"] = word.lng2;
            wordDic["lastShown"] = word.lastShown;
            wordDic["frequency"] = word.frequency;
            wordDic["successful"] = word.successful;
            wordsArr.addObject(wordDic);
        }
        dic["words"] = wordsArr;

        return dic;
    }
}
