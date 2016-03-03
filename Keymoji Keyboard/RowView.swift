//
//  RowView.swift
//  Keymoji
//
//  Created by Chris Home on 25/02/2016.
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



class RowView: UIView
{
    class func createRowFromString (icons: String) -> UIView
    {
        let keys = generateKeyTypeArray(icons)
        return createRow(keys)
    }
    
    class func createRow (keys: [KeyType]) -> UIView
    {
        var buttons = [UIView]()
        for key in keys
        {
            buttons.append( getButton(key) )
        }
        
        let row = UIStackView(arrangedSubviews: buttons)
        row.axis         = UILayoutConstraintAxis.Horizontal
        row.distribution = UIStackViewDistribution.EqualSpacing
        row.alignment    = UIStackViewAlignment.Fill
        
        return row
    }
    
    private class func generateKeyTypeArray (icons: String) -> [KeyType]
    {
        var output = [KeyType]()
        for icon in icons.characters
        {
            let iconString = String(icon)
            let key = KeyType.Letter(iconString)
            output.append(key)
        }
        return output
    }
    
    private class func getButton (type: KeyType) -> UIButton
    {
        switch type
        {
        case .Letter(let character):
            let button = UIButton(type: UIButtonType.System)
            button.setTitle(String(character), forState: UIControlState.Normal)
            return button
            
        case .Shift:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("SH", forState: UIControlState.Normal)
            return button
        
        case .Backspace:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("BS", forState: UIControlState.Normal)
            return button
            
        case .Numbers:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("123", forState: UIControlState.Normal)
            return button
            
        case .KeyboardSwitcher:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("KS", forState: UIControlState.Normal)
            return button
            
        case .Space:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("Space", forState: UIControlState.Normal)
            return button
            
        case .Return:
            let button = UIButton(type: UIButtonType.System)
            button.setTitle("Return", forState: UIControlState.Normal)
            return button
        }
    }
}
