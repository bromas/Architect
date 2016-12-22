//
//  ConstrainingEquate.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 5/7/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

public typealias EquateResult = [BlueprintMeasure: NSLayoutConstraint]
public typealias ExtendedEquateOptions = (relation: BlueprintRelation, magnitude: CGFloat, multiplier: CGFloat, priority: BlueprintPriority)

import Foundation
import UIKit

extension Constrain {
  
  public static func equate(heightOf view: UIView, fromRatioToWidth: CGFloat) -> NSLayoutConstraint {
    let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: fromRatioToWidth, constant: 0)
    view.addConstraint(constraint)
    return constraint
  }
  
  public static func equate(widthOf view: UIView, fromRatioToHeight: CGFloat) -> NSLayoutConstraint {
    let constraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: fromRatioToHeight, constant: 0)
    view.addConstraint(constraint)
    return constraint
  }
  
  public static func equate(_ view: UIView, with options: [BlueprintMeasure: CGFloat]) -> EquateResult {
    var newOptions = [BlueprintMeasure: ExtendedEquateOptions]()
    for (measure, float) in options {
      let option = (BlueprintRelation.equal, options[measure]!, float, BlueprintPriority.required)
      newOptions[measure] = option
    }
    return equate(view, to: view, withExtendedOptions: newOptions)
  }
  
  public static func equate(_ view: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedEquateOptions]) -> EquateResult {
    return equate(view, to: view, withExtendedOptions: options)
  }
  
  public static func equate(_ view: UIView, to toView: UIView, with options: [BlueprintMeasure: CGFloat]) -> EquateResult {
    var newOptions = [BlueprintMeasure: ExtendedEquateOptions]()
    for (measure, float) in options {
      let option = (BlueprintRelation.equal, options[measure]!, float, BlueprintPriority.required)
      newOptions[measure] = option
    }
    return equate(view, to: toView, withExtendedOptions: newOptions)
  }
  
  public static func equate(_ view: UIView, to toView: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedEquateOptions]) -> EquateResult {
    
    let superview = assertCommonSuperview(view, and: toView)
    var constraints = EquateResult()
    let finalToView: UIView? = view == toView ? .none : toView
    
    for (attribute, with): (BlueprintMeasure, ExtendedEquateOptions) in options {
      let relation = with.relation.layoutRelation()
      let priority = with.priority.float()
      switch attribute {
      case .width:
        let constraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: relation, toItem: finalToView, attribute: .width, multiplier: with.multiplier, constant: with.magnitude)
        constraint.priority = priority
        constraints[.width] = constraint
        superview.addConstraint(constraints[.width]!)
      case .height:
        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: relation, toItem: finalToView, attribute: .height, multiplier: with.multiplier, constant: with.magnitude)
        constraint.priority = priority
        constraints[.height] = constraint
        superview.addConstraint(constraints[.height]!)
      }
    }
    
    return constraints
  }
  
}
