//
//  FixBlueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias ExtendedSizeOptions = (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)

import Foundation
import UIKit

extension Blueprint {
    
    public class func size(view: UIView, with options: [BlueprintMeasure: Float]) -> Blueprints {
        var newOptions = [BlueprintMeasure: ExtendedSizeOptions]()
        for (measure, float) in options {
            let option = (BlueprintRelation.Equal, options[measure]! as Float, BlueprintPriority.Required)
            newOptions[measure] = option
        }
        return Blueprint.size(view, withExtendedOptions: newOptions)
    }
    
    public class func size (view: UIView , withExtendedOptions options: [BlueprintMeasure: (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> Blueprints {
        
        var constraints = [AnyObject]()
        let views = ["view": view]
        
        for (attribute: BlueprintMeasure, with: ExtendedSizeOptions) in options {
            let relation = with.relation.string()
            let priority = with.priority.float()
            switch attribute {
            case .Width:
                let metrics = ["width": with.magnitude]
                constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("H:[view(\(relation)width@\(priority))]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
            case .Height:
                let metrics = ["height": with.magnitude]
                constraints = constraints + NSLayoutConstraint.constraintsWithVisualFormat("V:[view(\(relation)height@\(priority))]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
            }
        }
        
        return constraints as! [NSLayoutConstraint]
    }
}