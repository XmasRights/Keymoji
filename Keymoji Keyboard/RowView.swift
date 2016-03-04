//
//  RowView.swift
//  Keymoji
//
//  Created by Chris Home on 25/02/2016.
//  Copyright © 2016 Christmas House. All rights reserved.
//

import UIKit

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
        for keyType in keys
        {
            let key = Key(keyType: keyType)
            key.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            buttons.append(key)
        }
        
        let row = UIStackView(arrangedSubviews: buttons)
        row.axis         = UILayoutConstraintAxis.Horizontal
        row.distribution = UIStackViewDistribution.EqualSpacing
        row.alignment    = UIStackViewAlignment.Fill
        
        self.addSubview(row)
        
        row.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints (NSLayoutConstraint.constraintsWithVisualFormat("H:|[i]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["i" : row]))
        self.addConstraints (NSLayoutConstraint.constraintsWithVisualFormat("V:|[i]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["i" : row]))
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
    
    private func buttonPressed(sender: Key!)
    {
        print("\(sender.type)")
    }
}
