//
//  InsetArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Grunt {
    
    public class func inset (view: UIView, with options: [BlueprintGuide: Float]) -> Void {
        Blueprint.assertSuperview(forView: view)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.inset(view, with: options))
        }
    }
    
    public class func inset (view: UIView, withExtendedOptions options: [BlueprintGuide: (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> Void {
        Blueprint.assertSuperview(forView: view)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.inset(view, withExtendedOptions: options))
        }
    }
    
    public class func inset (#origin: (x: Float, y: Float), of view: UIView) -> Void {
        Blueprint.assertSuperview(forView: view)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.inset(origin: origin, ofView: view))
        }
    }
    
}