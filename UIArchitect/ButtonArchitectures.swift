//
//  ButtonArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
    
    public class func button (#type: UIButtonType, inView view: UIView, construct: Construction) -> UIButton {
        return self.custom(UIButton.buttonWithType(type) as UIView, inView: view, construct: construct) as UIButton
    }
    
    public class func button (#type: UIButtonType, inView view: UIView) -> UIButton {
        return self.custom(UIButton.buttonWithType(type) as UIView, inView: view) as UIButton
    }
    
}
