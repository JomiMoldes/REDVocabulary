//
// Created by MIGUEL MOLDES on 10/1/16.
// Copyright (c) 2016 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import SwiftyJSON

class REDJSONFileManager {

    var filePath : String!;

    func createFile(name:String){
        let fm : NSFileManager = NSFileManager.defaultManager()
        let dir : String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        self.filePath = dir.stringByAppendingString(name);


        if(!fm.fileExistsAtPath(dir.stringByAppendingString(REDConstants.Paths.USER_DATA_DIRECTORY))){
            do{
                try fm.createDirectoryAtPath(dir.stringByAppendingString(REDConstants.Paths.USER_DATA_DIRECTORY), withIntermediateDirectories: false, attributes: nil)
            }catch let error as NSError{
                print("can't create directory " + error.description)
            }
        }

        if !fm.fileExistsAtPath(self.filePath) {

            if !fm.createFileAtPath(self.filePath, contents:nil, attributes: nil) {
                print("no se pudo crear el archivo: " + self.filePath)
            }
            updateFile(name, getDefaultJSONContent())
//            do{
//                try fm.createFileAtPath(self.filePath, contents:nil, attributes: nil)
//
//            }catch let error as NSError{
//                print("no se pudo crear el archivo: " + error.description)
//            }
//            do{
//                try updateFile(name, getDefaultJSONContent())
//            }catch let error as NSError{
//                print("no update for the file " + error.description)
//            }
        }
    }

    func getDefaultJSONContent()->String{
        let dic:NSMutableDictionary = NSMutableDictionary()
        dic["words"] = []
        let json:JSON = JSON(dic)
        return json.description
    }

    func updateFile(name:String,_ content:String){
        let file = name
        let textContent = content
        if let dir:NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first{
            let path = dir.stringByAppendingString(file)

            let data = textContent.dataUsingEncoding(NSUTF8StringEncoding)
            let fileHandler = NSFileHandle(forWritingAtPath: path)

            fileHandler!.writeData(data!)
//            do{
//                try fileHandler!.writeData(data!)
//            }catch{
//                print("not possible to update file ")
//            }
        }
    }

    func getWordsFromJSON(fileName:String)->NSDictionary{
        let fm = NSFileManager.defaultManager()
        if let data : NSData = fm.contentsAtPath(fileName){
            let json:JSON = JSON(data)
            print(json.description)

        }
        return NSDictionary()
    }


}
