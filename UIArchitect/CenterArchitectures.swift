//
//  CenterArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Grunt {
    
    public class func center(view: UIView, from: UIView, with options: [BlueprintCoordinate: Float]) -> [NSLayoutConstraint] {
        let constraints = Blueprint.center(view, fromView: from, with: options)
        view.superview?.addConstraints(constraints)
        return constraints
    }
    
    public class func center(view: UIView, with options: [BlueprintCoordinate: Float]) -> [NSLayoutConstraint] {
        let constraints = Blueprint.center(view, fromView: view.superview!, with: options)
        view.superview?.addConstraints(constraints)
        return constraints
    }
    
}
