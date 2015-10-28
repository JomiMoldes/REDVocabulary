//
// Created by MIGUEL MOLDES on 28/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class REDInputView : UIView {
    
    var view : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
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



}
