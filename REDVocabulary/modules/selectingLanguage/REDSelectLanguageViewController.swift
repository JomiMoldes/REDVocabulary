//
// Created by MIGUEL MOLDES on 18/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

class REDSelectLanguageViewController : ViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lngPicker: UIPickerView!
    @IBOutlet weak var addLngView: UIView!
    @IBOutlet weak var addLngButton: UIButton!
    @IBOutlet weak var lng1TextField: UITextField!
    @IBOutlet weak var lng2TextField: UITextField!
    @IBOutlet weak var createLngButton: UIButton!
    @IBOutlet weak var cancelLngButton: UIButton!
    
    var languages = []
    
    
    override func viewDidLoad() {
        let defaults = REDUserDefaults.sharedInstance;
//        defaults.clearLanguagesCombinations();
        self.languages = defaults.getLanguagesCombinations();
        setupPicker()
        refreshOptions()
    }

    func setupPicker(){
        self.lngPicker.dataSource = self;
        self.lngPicker.delegate = self;
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
    }


    func refreshOptions(){
        let defaults = REDUserDefaults.sharedInstance;
        self.languages = defaults.getLanguagesCombinations();

        let hasLanguages = languages.count > 0;
        self.addLngView.hidden = hasLanguages;
        showPicker(hasLanguages)
        self.lngPicker.reloadAllComponents();
    }

    func showPicker(value:Bool){
        self.lngPicker.hidden = !value;
        self.startButton.hidden = !value;
    }

    
    // MARK PickerView delegates and data source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
         return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.languages.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.languages[row] as! String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    
    
    // MARK IBActions

    @IBAction func onSave(sender: UIButton) {
        self.addLngButton.hidden = false;
        
        if(self.lng1TextField.text == "" || self.lng2TextField.text == ""){
            refreshOptions()
            return
        }
        var name = NSString(format: "%@_%@", self.lng1TextField.text!, self.lng2TextField.text!);
        var defaults = REDUserDefaults.sharedInstance;
        defaults.saveNewCombinations(name)
        
        
        var wordsConfigManager = REDWordsConfigManager.sharedInstance;
        var fileName : String = NSString(format: "/mwords_%@.json", name) as String
        wordsConfigManager.createLanguagesFile(fileName)
        refreshOptions()
        
    }
    
    @IBAction func onCancel(sender: UIButton) {
        self.addLngView.hidden = true;
        self.addLngButton.hidden = false;
        showPicker(true)
    }
    
    @IBAction func onPlus(sender: AnyObject) {
        self.addLngView.hidden = false;
        self.addLngButton.hidden = true;
        self.lng1TextField.text = "";
        self.lng2TextField.text = "";
        showPicker(false)
    }

}
