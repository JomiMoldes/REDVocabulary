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
        uncoveredSlot1()
    }

    func loadLanguagesFile(){
        let parser = REDWordsParser()
        let words : NSArray = parser.parseWords(REDWordsConfigManager.sharedInstance.getLanguagesFilePath());
    }

    func setupLabels(){
        self.input1View.languageNameLabel.text = self.principalLanguage;
        self.input2View.languageNameLabel.text = self.secondaryLanguage;
    }

    func uncoveredSlot1(){
        self.input1View.coverButton.hidden = true;
        self.input2View.coverButton.hidden = true;
    }
}
