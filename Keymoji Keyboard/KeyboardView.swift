//
//  KeyboardView.swift
//  Keymoji
//
//  Created by Chris Home on 25/02/2016.
//  Copyright © 2016 Christmas House. All rights reserved.
//

import UIKit

class KeyboardView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        createKeyboard()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        createKeyboard()
    }
    
    func createKeyboard()
    {
        let stack = createMainStack()
        stack.addArrangedSubview(createRow("QWERTYUIOP"))
        stack.addArrangedSubview(createRow("ASDFGHJKL"))
        stack.addArrangedSubview(createRow("ZXCVBNM"))
    }
    
    func createMainStack() -> UIStackView
    {
        let mainStack = UIStackView()
        mainStack.axis         = UILayoutConstraintAxis.Vertical
        mainStack.distribution = UIStackViewDistribution.EqualSpacing
        mainStack.alignment    = UIStackViewAlignment.Fill
        
        self.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in [NSLayoutAttribute.Top, NSLayoutAttribute.Leading, NSLayoutAttribute.Right, NSLayoutAttribute.Bottom]
        {
            self.addConstraint(NSLayoutConstraint(item: mainStack, attribute: attribute, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: attribute, multiplier: 1.0, constant: 0));
        }
        return mainStack
    }
    
    func createRow (icons : String) -> UIStackView
    {
        var buttons : [UIView] = []
        for icon in icons.characters
        {
            let button = UIButton(type: UIButtonType.System)
            button.setTitle(String(icon), forState: UIControlState.Normal)
            buttons.append(button)
        }
        
        let row = UIStackView(arrangedSubviews: buttons)
        row.axis         = UILayoutConstraintAxis.Horizontal
        row.distribution = UIStackViewDistribution.EqualSpacing
        row.alignment    = UIStackViewAlignment.Fill
        
        return row
    }

}
