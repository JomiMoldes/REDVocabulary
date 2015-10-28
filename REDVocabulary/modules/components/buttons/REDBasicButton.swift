//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import UIKit

class REDBasicButton : UIButton {


    override func awakeFromNib(){
        super.awakeFromNib()
        setupBackground()
    }

    func setupBackground(){
        let consts = UIEdgeInsetsMake(36, 36, 36, 36);
        var buttonBgUp : UIImage = UIImage(named:"Button.png")!
        var buttonBgDown : UIImage = UIImage(named:"Button.png")!
        var buttonBgDisabled : UIImage = UIImage(named:"Button.png")!

        buttonBgUp = buttonBgUp.resizableImageWithCapInsets(consts)
        buttonBgDown = buttonBgUp.resizableImageWithCapInsets(consts)
        buttonBgDisabled = buttonBgUp.resizableImageWithCapInsets(consts)

        setBackgroundImage(buttonBgUp, forState: UIControlState.Normal)
        setBackgroundImage(buttonBgDown, forState: UIControlState.Highlighted)
        setBackgroundImage(buttonBgDisabled, forState: UIControlState.Disabled)
        setBackgroundImage(buttonBgUp, forState: UIControlState.Selected)

    }
}
