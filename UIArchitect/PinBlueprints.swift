//
//  PinBlueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias ExtendedPinningOptions = (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)

import Foundation

extension Blueprint {
    
    public class func pin (view: UIView, toView: UIView, with options: [BlueprintGuide: (toEdge: BlueprintGuide, magnitude: Float)]) -> Blueprints {
        var newOptions = [BlueprintGuide: ExtendedPinningOptions]()
        for (guide, option) in options {
            let newOption = (option.toEdge, BlueprintRelation.Equal, option.magnitude, BlueprintPriority.Required)
            newOptions[guide] = newOption
        }
        return Blueprint.pin(view, toView: toView, withExtendedOptions: newOptions)
    }
    
    public class func pin (view: UIView, toView: UIView, withExtendedOptions options: [BlueprintGuide: (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> Blueprints {
        
        var constraints = [AnyObject]()
        
        for (attribute: BlueprintGuide, with: ExtendedPinningOptions) in options {
            let toEdge = with.toEdge
            let priority = with.priority.float()
            
            for (guide, option) in options {
                let newConstraint = NSLayoutConstraint(item: view, attribute: attribute.layoutAttribute(), relatedBy: option.relation.layoutRelation(),
                    toItem: toView, attribute: toEdge.layoutAttribute(), multiplier: 1, constant: CGFloat(option.magnitude))
                newConstraint.priority = priority
                constraints.append(newConstraint)
            }
        }
        
        return constraints as! [NSLayoutConstraint]
    }
    
}
