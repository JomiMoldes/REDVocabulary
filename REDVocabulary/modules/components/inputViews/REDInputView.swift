//
// Created by MIGUEL MOLDES on 28/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class REDInputView : UIView, UITextViewDelegate {
    
    var view : UIView!
    
    @IBOutlet weak var wordTextView: REDInputTextView!
    @IBOutlet weak var languageNameLabel: UILabel!
    @IBOutlet weak var coverButton: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        addObservers()
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
        
    }
    
    func loadViewFromNib()->UIView{
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "REDInputView", bundle: bundle)
        let nibView = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return nibView
    }

    func addObservers() {
        self.wordTextView.delegate = self;
    }

    func onTextTapped() {
        self.wordTextView.text = ""
    }

    func setupOriginalText(label : String) {
        self.wordTextView.originalText = label
        setupContentText(label)
    }

    func setupContentText(text : String) {
        self.wordTextView.text = text
    }

    func hasValidText() -> Bool{
        if(self.wordTextView.text == self.wordTextView.originalText){
            return false;
        }
        if(self.wordTextView.text == ""){
            return false;
        }
        return true;
    }

    func refresh(){
        self.wordTextView.text = self.wordTextView.originalText;
    }


    /// Protocols

    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        if self.wordTextView.text == self.wordTextView.originalText {
            self.wordTextView.text = ""
        }
        return true
    }

    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        if self.wordTextView.text == "" {
            self.wordTextView.text = self.wordTextView.originalText
        }
        return true
    }



    /// @IBActions

    @IBAction func coverButtonTouched(sender: AnyObject) {
        print("touched")
    }

    @IBAction func inputTextTapped(sender: AnyObject) {

    }


}
