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
    
    private func createKeyboard()
    {
        let stack = createMainStack()
        
        let row0 = RowView.generateKeyTypeArray("😀😬😁😂😃😄😅😆😇😉😊")
        let row1 = RowView.generateKeyTypeArray("QWERTYUIOP")
        let row2 = RowView.generateKeyTypeArray("ASDFGHJKL")
        var row3 = RowView.generateKeyTypeArray("ZXCVBNM")
        row3.insert(KeyType.Shift, atIndex: 0)
        row3.append(KeyType.Backspace)
        let row4 = [KeyType.Numbers, KeyType.KeyboardSwitcher, KeyType.Space, KeyType.Return]
        
        stack.addArrangedSubview(RowView.createRow(row0))
        stack.addArrangedSubview(RowView.createRow(row1))
        stack.addArrangedSubview(RowView.createRow(row2))
        stack.addArrangedSubview(RowView.createRow(row3))
        stack.addArrangedSubview(RowView.createRow(row4))
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
