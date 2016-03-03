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
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    convenience init(icons: String)
    {
        self.init(frame:CGRect.zero)
        
        let keys = RowView.generateKeyTypeArray(icons)
        createRow(keys)
    }
    
    convenience init(keys: [KeyType])
    {
        self.init(frame:CGRect.zero)
        
        createRow(keys)
    }
    
    private func createRow (keys: [KeyType])
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
        
        self.addSubview(row)
        
        row.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[i]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["i" : row]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[i]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["i" : row]))
    }
    
    class func generateKeyTypeArray (icons: String) -> [KeyType]
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
    
    private func getButton (type: KeyType) -> UIButton
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
