//
//  KeyboardViewController.swift
//  Keymoji Keyboard
//
//  Created by Chris Home on 25/02/2016.
//  Copyright © 2016 Christmas House. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    
//    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.purpleColor()
        createKeyboard();
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
        
        self.view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in [NSLayoutAttribute.Top, NSLayoutAttribute.Leading, NSLayoutAttribute.Right, NSLayoutAttribute.Bottom]
        {
            self.view.addConstraint(NSLayoutConstraint(item: mainStack, attribute: attribute, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: attribute, multiplier: 1.0, constant: 0));
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
//    
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
//            textColor = UIColor.whiteColor()
//        } else {
//            textColor = UIColor.blackColor()
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
