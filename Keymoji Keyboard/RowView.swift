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
//    override init(frame: CGRect)
//    {
//        super.init(frame: frame)
//    }
//    
//    required init(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)!
//    }
    
    class func createRow (icons : String) -> UIStackView
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
