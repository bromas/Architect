//
//  PinArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 8/2/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Grunt {
    
    public class func pin(top view: UIView, toBottom toView: UIView, withMagnitude magnitude: Float) -> Void {
        Blueprint.assertSuperview(forView: view)
        Blueprint.assertSuperview(forView: toView)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: toView, with: [.Top: (.Bottom, magnitude)]))
        }
    }
    
    public class func pin(left view: UIView, toRight toView: UIView, withMagnitude magnitude: Float) -> Void {
        Blueprint.assertSuperview(forView: view)
        Blueprint.assertSuperview(forView: toView)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: toView, with: [.Left: (.Right, magnitude)]))
        }
    }
    
    public class func pin(right view: UIView, toLeft toView: UIView, withMagnitude magnitude: Float) -> Void {
        Blueprint.assertSuperview(forView: view)
        Blueprint.assertSuperview(forView: toView)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: toView, with: [.Right: (.Left, magnitude)]))
        }
    }
    
    public class func pin(bottom view: UIView, toTop toView: UIView, withMagnitude magnitude: Float) -> Void {
        Blueprint.assertSuperview(forView: view)
        Blueprint.assertSuperview(forView: toView)
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: toView, with: [.Bottom: (.Top, magnitude)]))
        }
    }
    
    public class func pin (view: UIView, to: UIView, with options: [BlueprintGuide: (toEdge: BlueprintGuide, magnitude: Float)]) -> Void {
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: to, with: options))
        }
    }
    
    public class func pin (view: UIView, toView: UIView, withExtendedOptions options: [BlueprintGuide: (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> Void {
        if let hasSuper = view.superview {
            hasSuper.addConstraints(Blueprint.pin(view, toView: toView, withExtendedOptions: options))
        }
    }
    
}