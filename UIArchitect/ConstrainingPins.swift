//
//  PinArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 8/2/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias ExtendedPinningOptions = (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)
public typealias PinResult = [BlueprintGuide: NSLayoutConstraint]
public typealias EdgeGuide = (view: UIView, edge: BlueprintGuide)

import Foundation
import UIKit

extension Constrain {
  
  public class func pin(from: EdgeGuide, to: EdgeGuide, at magnitude: CGFloat) -> NSLayoutConstraint {
    return pin(from, to: to, at: magnitude)
  }
  
  public class func pin(view: UIView, to toView: UIView, with options: [BlueprintGuide: (toEdge: BlueprintGuide, magnitude: CGFloat)]) -> PinResult {
    return pin(view, to: toView, with: options)
  }
  
  public class func pin(view: UIView, to toView: UIView, withExtendedOptions options: [BlueprintGuide: (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> PinResult {
    return pin(view, to: toView, withExtendedOptions: options)
  }
  
}

public func pin(#top: UIView, #toBottom: UIView, #magnitude: CGFloat) -> NSLayoutConstraint {
  return pin((top, .Top), to: (toBottom, .Bottom), magnitude: magnitude)
}

public func pin(#right: UIView, #toLeft: UIView, #magnitude: CGFloat) -> NSLayoutConstraint {
  return pin((right, .Right), to: (toLeft, .Left), magnitude: magnitude)
}

public func pin(#bottom: UIView, #toTop: UIView, #magnitude: CGFloat) -> NSLayoutConstraint {
  return pin((bottom, .Bottom), to: (toTop, .Top), magnitude: magnitude)
}

public func pin(#left: UIView, #toRight: UIView, #magnitude: CGFloat) -> NSLayoutConstraint {
  return pin((left, .Left), to: (toRight, .Right), magnitude: magnitude)
}

public func pin(from: EdgeGuide, #to: EdgeGuide, #magnitude: CGFloat) -> NSLayoutConstraint {
  var newOptions = [BlueprintGuide: ExtendedPinningOptions]()
  newOptions[from.edge] = (to.edge, BlueprintRelation.Equal, magnitude, BlueprintPriority.Required)
  return pin(from.view, to: to.view, withExtendedOptions: newOptions)[from.edge]!
}

public func pin(view: UIView, to toView: UIView, with options: [BlueprintGuide: (toEdge: BlueprintGuide, magnitude: CGFloat)]) -> PinResult {
  var newOptions = [BlueprintGuide: ExtendedPinningOptions]()
  for (guide, option) in options {
    let newOption = (option.toEdge, BlueprintRelation.Equal, option.magnitude, BlueprintPriority.Required)
    newOptions[guide] = newOption
  }
  
  return pin(view, to: toView, withExtendedOptions: newOptions)
}

public func pin(view: UIView, to toView: UIView, withExtendedOptions options: [BlueprintGuide: (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> PinResult {
  
  let superview = assertCommonSuperview(view, and: toView)
  
  var constraints = [BlueprintGuide: NSLayoutConstraint]()
  
  for (attribute: BlueprintGuide, with: ExtendedPinningOptions) in options {
    let toEdge = with.toEdge
    let priority = with.priority.float()
    
    for (guide, option) in options {
      let newConstraint = NSLayoutConstraint(item: view, attribute: attribute.layoutAttribute(), relatedBy: option.relation.layoutRelation(),
        toItem: toView, attribute: toEdge.layoutAttribute(), multiplier: 1, constant: CGFloat(option.magnitude))
      newConstraint.priority = priority
      constraints[guide] = newConstraint
      superview.addConstraint(constraints[guide]!)
    }
  }
  
  return constraints
}