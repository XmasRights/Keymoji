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
    var keyCallback: (() -> KeyType)?
    
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
    
    private func createKeyboard()
    {
        let stack = createMainStack()
        
        let row0 = RowView(icons: ("😀😬😁😂😃😄😅😆😇😉😊"))
        let row1 = RowView(icons: ("QWERTYUIOP"))
        let row2 = RowView(icons: ("ASDFGHJKL"))
        
        var row3Keys = RowView.generateKeyTypeArray("ZXCVBNM")
        row3Keys.insert(KeyType.Shift, atIndex: 0)
        row3Keys.append(KeyType.Backspace)
        let row3 = RowView(keys: row3Keys)
        
        let row4Keys = [KeyType.Numbers, KeyType.KeyboardSwitcher, KeyType.Space, KeyType.Return]
        let row4 = RowView(keys: row4Keys)
        
        stack.addArrangedSubview(row0)
        stack.addArrangedSubview(row1)
        stack.addArrangedSubview(row2)
        stack.addArrangedSubview(row3)
        stack.addArrangedSubview(row4)
    }
    
    private func createMainStack() -> UIStackView
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
}
