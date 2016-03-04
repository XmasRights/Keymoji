//
//  Key.swift
//  Keymoji
//
//  Created by Chris Home on 04/03/2016.
//  Copyright © 2016 Christmas House. All rights reserved.
//

import UIKit

enum KeyType
{
    case Letter(String)
    case Shift
    case Backspace
    case Numbers
    case KeyboardSwitcher
    case Space
    case Return
}

class Key: UIButton
{
    var type : KeyType?
    
    required init?(coder aDecoder: NSCoder)
    {
        self.type = nil
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect)
    {
        self.type = nil
        super.init(frame: CGRect.zero)
    }
    
    convenience init(keyType: KeyType)
    {
        self.init(frame: CGRect.zero)
        self.type = keyType
    }
    
    
    private func configure (type: KeyType)
    {
        switch type
        {
        case .Letter(let character):
            setTitle(String(character), forState: UIControlState.Normal)
            
        case .Shift:
            setTitle("SH", forState: UIControlState.Normal)
            
        case .Backspace:
            setTitle("BS", forState: UIControlState.Normal)
            
        case .Numbers:
            setTitle("123", forState: UIControlState.Normal)
            
        case .KeyboardSwitcher:
            setTitle("KS", forState: UIControlState.Normal)

        case .Space:
            setTitle("Space", forState: UIControlState.Normal)
            
        case .Return:
            addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
