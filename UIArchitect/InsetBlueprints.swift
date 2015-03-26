//
//  EdgeInsetBlueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias ExtendedInsetOptions = (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)

import Foundation
import UIKit

public enum InsetDirection {
    case Top
    case Left
    case Bottom
    case Right
}

extension Blueprint {
    
    public class func inset(#edges: UIEdgeInsets, of view: UIView) -> Blueprints {
        
        self.assertSuperview(forView: view)
        var constraints = [AnyObject]()
        
        let views = ["view": view]
        let metrics = ["topInset":edges.top, "bottomInset":edges.bottom, "leftInset":edges.left, "rightInset":edges.right]
        let options = NSLayoutFormatOptions(0)
        
        constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("V:|-(topInset)-[view]-(bottomInset)-|", options:options, metrics: metrics, views: views)
        constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("H:|-(leftInset)-[view]-(rightInset)-|", options:options, metrics: metrics, views: views)
        
        return constraints as! Blueprints
    }
    
    public class func inset (view: UIView, withExtendedOptions options: [BlueprintGuide: (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> Blueprints {
        
        self.assertSuperview(forView: view)
        var constraints = [AnyObject]()
        
        for (direction, option) in options {
            var formatString: String = ""
            var insetString = "\(option.relation.string())\(option.magnitude)@\(option.priority.float())"
            
            switch direction {
            case .Top:
                formatString = "V:|-(\(insetString))-[forView]"
            case .Left:
                formatString = "H:|-(\(insetString))-[forView]"
            case .Bottom:
                formatString = "V:[forView]-(\(insetString))-|"
            case .Right:
                formatString = "H:[forView]-(\(insetString))-|"
            case .Center:
                assert(false, "Do not inset the center coordinate")
            }
            
            let metrics = ["insetSize": option.magnitude]
            constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: NSLayoutFormatOptions(0), metrics: metrics, views: ["forView":view])
        }
        
        return constraints as! Blueprints
    }
    
    public class func inset (view: UIView, with options: [BlueprintGuide: Float]) -> Blueprints {
        
        self.assertSuperview(forView: view)
        var constraints = [AnyObject]()
        
        for (option, magnitude) in options {
            var formatString: String = ""
            
            switch option {
            case .Top:
                formatString = "V:|-(insetSize)-[forView]"
            case .Left:
                formatString = "H:|-(insetSize)-[forView]"
            case .Bottom:
                formatString = "V:[forView]-(insetSize)-|"
            case .Right:
                formatString = "H:[forView]-(insetSize)-|"
            case .Center:
                assert(false, "Do not inset the center coordinate")
            }
            
            let metrics = ["insetSize":magnitude]
            constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: NSLayoutFormatOptions(0), metrics: metrics, views: ["forView":view])
        }
        
        return constraints as! Blueprints
    }
    
    public class func inset (#origin: (x: Float, y: Float), of view: UIView) -> Blueprints {
        
        self.assertSuperview(forView: view)
        var constraints = [AnyObject]()
        
        let views = ["view": view]
        let metrics = ["x": origin.x, "y": origin.y]
        let options = NSLayoutFormatOptions(0)
        
        constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("V:|-(y)-[view]", options:options, metrics: metrics, views: views)
        constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("H:|-(x)-[view]", options:options, metrics: metrics, views: views)
        
        return constraints as! Blueprints
    }
}
