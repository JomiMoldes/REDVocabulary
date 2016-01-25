//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class REDWordsConfigManager {

    static let sharedInstance = REDWordsConfigManager()



    private init(){

    }

    func createFileForLanguages(principalLanguage:String, secondaryLanguage:String)->Bool{

        createFile(getLanguagesFilePath())
        return true;
    }

    func createFile(name:String){
        let jsonManager : REDJSONFileManager = REDJSONFileManager();
        jsonManager.createFile(name);
        return
    }

    func saveWordsInFile(name:String, content:String){
        let jsonManager : REDJSONFileManager = REDJSONFileManager();
        let json = getJSONToSave()
        jsonManager.updateFile(name, json.description);
    }

    func getJSONToSave()->JSON{
        let dic = REDWordsModel.sharedInstance.getWordsForSaving()
        let json:JSON = JSON(dic)
        return json;
    }

    func getLanguagesFilePath()->String{
        let name = REDWordsModel.sharedInstance.principalLanguage + "_" + REDWordsModel.sharedInstance.secondaryLanguage;
        let filePath: String = REDConstants.Paths.USER_DATA_DIRECTORY + "/mwords_" + name + ".json"
        return filePath
    }

    func clearAllUserData(){
        let fm : NSFileManager = NSFileManager.defaultManager()
        let dir : String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        var REDDir = dir.stringByAppendingString(REDConstants.Paths.USER_DATA_DIRECTORY)
        REDDir = dir.stringByAppendingString("/")

        if let enumerator = fm.enumeratorAtPath(REDDir){
            while let file = enumerator.nextObject() as? String{
                do{
                    let fileName = REDDir.stringByAppendingString(file)
                    try fm.removeItemAtPath(fileName)
                }catch let error as NSError{
                    print("no se pudo remover el item: " + error.description)
                }
            }
        }

        do{
            try fm.removeItemAtPath(dir.stringByAppendingString(REDConstants.Paths.USER_DATA_DIRECTORY))
        }catch let error as NSError{
            print("cannot delete RED folder" + error.description)
        }
    }

    func getCurrentWordsSet()->NSDictionary{
        let dir : String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let fileName = dir.stringByAppendingString(getLanguagesFilePath())
        let jsonManager : REDJSONFileManager = REDJSONFileManager();
        let words = jsonManager.getWordsFromJSON(fileName)
        return words
    }
}
