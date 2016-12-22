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
  
  public static func pin(top: UIView, toBottom: UIView, magnitude: CGFloat) -> NSLayoutConstraint {
    return Constrain.pin((top, .top), to: (toBottom, .bottom), magnitude: magnitude)
  }
  
  public static func pin(right: UIView, toLeft: UIView, magnitude: CGFloat) -> NSLayoutConstraint {
    return Constrain.pin((right, .right), to: (toLeft, .left), magnitude: magnitude)
  }
  
  public static func pin(bottom: UIView, toTop: UIView, magnitude: CGFloat) -> NSLayoutConstraint {
    return Constrain.pin((bottom, .bottom), to: (toTop, .top), magnitude: magnitude)
  }
  
  public static func pin(left: UIView, toRight: UIView, magnitude: CGFloat) -> NSLayoutConstraint {
    return Constrain.pin((left, .left), to: (toRight, .right), magnitude: magnitude)
  }
  
  public static func pin(_ view: UIView, edge:BlueprintGuide, toGuide: UILayoutSupport, inController: UIViewController, constant: CGFloat) -> NSLayoutConstraint {
    let constraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: toGuide, attribute: .bottom, multiplier: 1.0, constant: constant)
    inController.view.addConstraint(constraint)
    return constraint
  }
  
  public static func pin(_ from: EdgeGuide, to: EdgeGuide, magnitude: CGFloat) -> NSLayoutConstraint {
    var newOptions = [BlueprintGuide: ExtendedPinningOptions]()
    newOptions[from.edge] = (to.edge, BlueprintRelation.equal, magnitude, BlueprintPriority.required)
    return pin(from.view, to: to.view, withExtendedOptions: newOptions)[from.edge]!
  }
  
  public static func pin(_ view: UIView, to toView: UIView, with options: [BlueprintGuide: (toEdge: BlueprintGuide, magnitude: CGFloat)]) -> PinResult {
    var newOptions = [BlueprintGuide: ExtendedPinningOptions]()
    for (guide, option) in options {
      let newOption = (option.toEdge, BlueprintRelation.equal, option.magnitude, BlueprintPriority.required)
      newOptions[guide] = newOption
    }
    
    return pin(view, to: toView, withExtendedOptions: newOptions)
  }
  
  public static func pin(_ view: UIView, to toView: UIView, withExtendedOptions options: [BlueprintGuide: (toEdge: BlueprintGuide, relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> PinResult {
    
    let superview = assertCommonSuperview(view, and: toView)
    
    var constraints = [BlueprintGuide: NSLayoutConstraint]()
    
    for (attribute, with): (BlueprintGuide, ExtendedPinningOptions) in options {
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
  
}
