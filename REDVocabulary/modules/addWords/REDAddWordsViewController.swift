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

        let originalText: String = REDConstants.DefaultInputTexts.INSERT_WORD_HERE;
        self.input1View.setupOriginalText(originalText.stringByReplacingOccurrencesOfString("-lng-", withString: self.principalLanguage))
        self.input2View.setupOriginalText(originalText.stringByReplacingOccurrencesOfString("-lng-", withString: self.secondaryLanguage))
    }

    func uncoveredSlots(){
        self.input1View.coverButton.hidden = true;
        self.input2View.coverButton.hidden = true;
    }






    /// @IBActions

    @IBAction func addButtonTouched(sender: AnyObject) {
        guard let text1 = self.input1View.wordTextView.text else{
            return
        }

        guard let text2 = self.input2View.wordTextView.text else{
            return
        }
        if(!self.input1View.hasValidText()){
            return;
        }
        if(!self.input2View.hasValidText()){
            return;
        }

        let word = REDWordsFactory().createWord(text1, text2);
        REDWordsModel.sharedInstance.addWord(word);

        self.input1View.refresh();
        self.input2View.refresh();
    }

    @IBAction func startButtonTouched(sender: AnyObject) {
        print("start button touched")
    }

}
