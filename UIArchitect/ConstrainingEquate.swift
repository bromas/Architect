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

public func equate(heightOf view: UIView, #fromRatioToWidth: CGFloat) -> NSLayoutConstraint {
  let constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: fromRatioToWidth, constant: 0)
  view.addConstraint(constraint)
  return constraint
}

public func equate(widthOf view: UIView, #fromRatioToHeight: CGFloat) -> NSLayoutConstraint {
  let constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: fromRatioToHeight, constant: 0)
  view.addConstraint(constraint)
  return constraint
}

public func equate(view: UIView, with options: [BlueprintMeasure: CGFloat]) -> EquateResult {
  var newOptions = [BlueprintMeasure: ExtendedEquateOptions]()
  for (measure, float) in options {
    let option = (BlueprintRelation.Equal, options[measure]!, CGFloat(1.0), BlueprintPriority.Required)
    newOptions[measure] = option
  }
  return equate(view, to: view, withExtendedOptions: newOptions)
}

public func equate(view: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedEquateOptions]) -> EquateResult {
  return equate(view, to: view, withExtendedOptions: options)
}

public func equate(view: UIView, to toView: UIView, with options: [BlueprintMeasure: CGFloat]) -> EquateResult {
  var newOptions = [BlueprintMeasure: ExtendedEquateOptions]()
  for (measure, float) in options {
    let option = (BlueprintRelation.Equal, options[measure]!, CGFloat(1.0), BlueprintPriority.Required)
    newOptions[measure] = option
  }
  return equate(view, to: toView, withExtendedOptions: newOptions)
}

public func equate(view: UIView, to toView: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedEquateOptions]) -> EquateResult {
  
  let superview = assertCommonSuperview(view, and: toView)
  var constraints = EquateResult()
  let finalToView: UIView? = view == toView ? .None : toView
  
  for (attribute: BlueprintMeasure, with: ExtendedEquateOptions) in options {
    let relation = with.relation.layoutRelation()
    let priority = with.priority.float()
    switch attribute {
    case .Width:
      var constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: relation, toItem: finalToView, attribute: .Width, multiplier: with.multiplier, constant: with.magnitude)
      constraint.priority = priority
      constraints[.Width] = constraint
      superview.addConstraint(constraints[.Width]!)
    case .Height:
      var constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: relation, toItem: finalToView, attribute: .Height, multiplier: with.multiplier, constant: with.magnitude)
      constraint.priority = priority
      constraints[.Height] = constraint
      superview.addConstraint(constraints[.Height]!)
    }
  }
  
  return constraints
}
