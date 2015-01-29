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
    
    public class func center(view: UIView, from: UIView, with options: [BlueprintCoordinate: Float]) -> Void {
        view.superview?.addConstraints(Blueprint.center(view, fromView: from, with: options))
    }
    
    public class func center(view: UIView, with options: [BlueprintCoordinate: Float]) -> Void {
        view.superview?.addConstraints(Blueprint.center(view, fromView: view.superview!, with: options))
    }
    
}
