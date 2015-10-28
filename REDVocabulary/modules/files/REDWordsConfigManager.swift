//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDWordsConfigManager {

    static let sharedInstance = REDWordsConfigManager()

    var filePath : String!;

    func createLanguagesFile(name:String)->Bool{

        createFile(name);
        return true;
    }

    func createFile(name:String){
        //var error : NSErrorPointer = nil;
        let fm : NSFileManager = NSFileManager.defaultManager()
        var content : String = ""
        let fileContent : NSData = content.dataUsingEncoding(NSUTF8StringEncoding)!
        let dir : String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let newDir : String = dir.stringByAppendingString("/RED")
        self.filePath = newDir.stringByAppendingString(name);
        
        if !fm.fileExistsAtPath(newDir){
            do{
                try fm.createDirectoryAtPath(newDir, withIntermediateDirectories: true, attributes: nil)
            }catch let error as NSError{
                NSLog("Couldn't create directory");
                NSLog("Error was code: %d - message: %s", error, error.localizedDescription);
            }
        }

        if !fm.fileExistsAtPath(self.filePath) {
            if !fm.createFileAtPath(self.filePath, contents: fileContent, attributes: nil) {
                NSLog("Couldn't create file");
                NSLog("Error was code: %d - message: %s", errno, strerror(errno));
            }
        }
    }

}
