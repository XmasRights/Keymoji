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
        stack.addArrangedSubview(RowView.createRow("😀😬😁😂😃😄😅😆😇😉😊"))
        stack.addArrangedSubview(RowView.createRow("QWERTYUIOP"))
        stack.addArrangedSubview(RowView.createRow("ASDFGHJKL"))
        stack.addArrangedSubview(RowView.createRow("ZXCVBNM"))
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
}
