//
//  InsetArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias InsetResult = [BlueprintGuide: NSLayoutConstraint]
public typealias ExtendedInsetOptions = (relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)

import Foundation
import UIKit

public func inset(view: UIView, withExtendedOptions options: [BlueprintGuide: (relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> InsetResult {
  
  let superview = assertSuperview(forView: view)
  var constraints = InsetResult()
  
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
    case .CenterX:
      assert(false, "Do not inset the center coordinate")
    case .CenterY:
      assert(false, "Do not inset the center coordinate")
    }
    
    let metrics = ["insetSize": option.magnitude]
    constraints[direction] = (NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: NSLayoutFormatOptions(0), metrics: metrics, views: ["forView":view])[0] as? NSLayoutConstraint)
    superview.addConstraint(constraints[direction]!)
  }
  
  return constraints
}

public func inset(view: UIView, with options: [BlueprintGuide: CGFloat]) -> InsetResult {
  
  let superview = assertSuperview(forView: view)
  var constraints = InsetResult()
  
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
    case .CenterX:
      assert(false, "Do not inset the center coordinate")
    case .CenterY:
      assert(false, "Do not inset the center coordinate")
    }
    
    let metrics = ["insetSize":magnitude]
    constraints[option] = (NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: NSLayoutFormatOptions(0), metrics: metrics, views: ["forView":view])[0] as! NSLayoutConstraint)
    superview.addConstraint(constraints[option]!)
  }
  
  return constraints
}