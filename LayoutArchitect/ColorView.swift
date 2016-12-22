//
//  ColorView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/12/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import UIKit

class ColorView : UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(color: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.backgroundColor = color
    }
}
