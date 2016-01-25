//
// Created by MIGUEL MOLDES on 21/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

class REDAddWordsViewController : ViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var input1View: REDInputView!
    @IBOutlet weak var input2View: REDInputView!
    
    @IBOutlet weak var startButton: REDBasicButton!
    
    @IBOutlet weak var addButton: REDBasicButton!

    var principalLanguage : String = ""
    var secondaryLanguage : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.principalLanguage = REDWordsModel.sharedInstance.principalLanguage
        self.secondaryLanguage = REDWordsModel.sharedInstance.secondaryLanguage

        loadLanguagesFile()
        setupLabels()
        uncoveredSlots()
        addKeyboardObservers()
    }

    func addKeyboardObservers(){
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector:"keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector:"keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardWillShow(notification:NSNotification){
        let userInfo = notification.userInfo!
        let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height;

    }

    func keyboardWillHide(notification:NSNotification){
        let userInfo = notification.userInfo!
        let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height;

    }

    func loadLanguagesFile(){
        let parser = REDWordsParser()
        let words : NSArray = parser.parseWords(REDWordsConfigManager.sharedInstance.getLanguagesFilePath());
    }

    func setupLabels(){
        self.input1View.languageNameLabel.text = self.principalLanguage;
        self.input2View.languageNameLabel.text = self.secondaryLanguage;
    }

    func uncoveredSlots(){
        self.input1View.coverButton.hidden = true;
        self.input2View.coverButton.hidden = true;
    }

    @IBAction func addButtonTouched(sender: AnyObject) {
        print("add taouched")
        guard let text1 = self.input1View.wordTextView.text else{
            return
        }

        guard let text2 = self.input2View.wordTextView.text else{
            return
        }

        print(text1)
        print(text2)
    }

    @IBAction func startButtonTouched(sender: AnyObject) {
        print("start button touched")
    }

}
