//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

class REDWordsConfigManager {

    static let sharedInstance = REDWordsConfigManager()

    let USER_DATA_DIRECTORY : String = "/RED"

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
        jsonManager.updateFile(name, content:content);
    }

    func getLanguagesFilePath()->String{
        let name = REDWordsModel.sharedInstance.principalLanguage + "_" + REDWordsModel.sharedInstance.secondaryLanguage;
        let filePath: String = USER_DATA_DIRECTORY + "/mwords_" + name + ".json"
        return filePath
    }

    func clearAllUserData(){
        let fm : NSFileManager = NSFileManager.defaultManager()
        var dir : String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        dir = dir.stringByAppendingString(USER_DATA_DIRECTORY)
        dir = dir.stringByAppendingString("/")

        if let enumerator = fm.enumeratorAtPath(dir){
            while let file = enumerator.nextObject() as? String{
                do{
                    let fileName = dir.stringByAppendingString(file)
                    try fm.removeItemAtPath(fileName)
                }catch let error as NSError{
                    print("no se pudo remover el item: " + error.description)
                }
            }
        }
    }



}
