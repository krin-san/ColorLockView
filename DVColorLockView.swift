//
//  DVColorLockView.swift
//  DVColorLockViewDemo
//
//  Created by Dylan Vann on 2014-10-22.
//  Copyright (c) 2014 Dylan Vann. All rights reserved.
//

import Foundation
import UIKit

// DVColorLockView ovverides the backgroundColor setter for UIView. 
// Highlighting a UITableViewCell won't change the color of its DVColorLockView subviews.
// (Highlighting a UITableViewCell changes the background color of all subviews, it's annoying.)
class DVColorLockView:UIView {

    var lockedBackgroundColor:UIColor {
        set {
            super.backgroundColor = newValue
        }
        get {
            return super.backgroundColor!
        }
    }
    
    override var backgroundColor:UIColor? {
        set {
			if !locked {
				lockedBackgroundColor = newValue
			}
        }
        get {
            return super.backgroundColor
        }
    }

	// MARK: Loading from NIB

    // Disallow/allow changing the backgroundColor by it's setter
    private var locked: Bool = true
    
	required init?(coder aDecoder: NSCoder) {
		locked = false
		super.init(coder: aDecoder)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		locked = true
	}

}
