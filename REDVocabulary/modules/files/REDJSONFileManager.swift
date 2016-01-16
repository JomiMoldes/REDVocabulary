//
// Created by MIGUEL MOLDES on 10/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import SwiftyJSON

class REDJSONFileManager {

    var filePath : String!;

    func createFile(name:String){
        //var error : NSErrorPointer = nil;
        let fm : NSFileManager = NSFileManager.defaultManager()
        /*let contentDic : NSMutableDictionary = REDWordsModel.sharedInstance.getWordsForSaving()
        let fileContent : NSData = NSData()
        do{
            let valid = NSJSONSerialization.isValidJSONObject(contentDic)
//            let fileContent : NSData = try NSJSONSerialization.JSONObjectWithData(contentDic, options: nil)

        }catch {

        }  */
        let dir : String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        self.filePath = dir.stringByAppendingString(name);

        if !fm.fileExistsAtPath(self.filePath) {
            do{
                try fm.createFileAtPath(self.filePath, contents:nil, attributes: nil)
            }catch let error as NSError{
                print("no se pudo crear el archivo: " + error.description)
            }
        }
    }

    func updateFile(name:String, content:String){
        let file = name
        var textContent = content
        if let dir:NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first{
            print(dir)
            let path = dir.stringByAppendingString(file)
            print(path)
            let jsonInfo = getJSONToSave()
            textContent = jsonInfo.description

            let data = textContent.dataUsingEncoding(NSUTF8StringEncoding)
            let fileHandler = NSFileHandle(forWritingAtPath: path)

            do{
                try fileHandler!.writeData(data!)
//                try textContent.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
//                try print(textContent)
            }catch{
                print("not possible to update file ")
            }


        }

    }

    func getJSONToSave()->JSON{
        let dic = REDWordsModel.sharedInstance.getWordsForSaving()
        let json:JSON = JSON(dic)
        return json;
    }


}
