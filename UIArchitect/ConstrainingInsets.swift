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

extension Constrain {
  
  public static func inset(_ view: UIView, withExtendedOptions options: [BlueprintGuide: (relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> InsetResult {
    
    let superview = assertSuperview(forView: view)
    var constraints = InsetResult()
    
    for (direction, option) in options {
      var formatString: String = ""
      let insetString = "\(option.relation.string())\(option.magnitude)@\(option.priority.float())"
      
      switch direction {
      case .top:
        formatString = "V:|-(\(insetString))-[forView]"
      case .left:
        formatString = "H:|-(\(insetString))-[forView]"
      case .bottom:
        formatString = "V:[forView]-(\(insetString))-|"
      case .right:
        formatString = "H:[forView]-(\(insetString))-|"
      case .centerX:
        assert(false, "Do not inset the center coordinate")
      case .centerY:
        assert(false, "Do not inset the center coordinate")
      }
      
      let metrics = ["insetSize": option.magnitude]
      constraints[direction] = (NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: ["forView":view])[0])
      superview.addConstraint(constraints[direction]!)
    }
    
    return constraints
  }
  
  public static func inset(_ view: UIView, with options: [BlueprintGuide: CGFloat]) -> InsetResult {
    
    let superview = assertSuperview(forView: view)
    var constraints = InsetResult()
    
    for (option, magnitude) in options {
      var formatString: String = ""
      
      switch option {
      case .top:
        formatString = "V:|-(insetSize)-[forView]"
      case .left:
        formatString = "H:|-(insetSize)-[forView]"
      case .bottom:
        formatString = "V:[forView]-(insetSize)-|"
      case .right:
        formatString = "H:[forView]-(insetSize)-|"
      case .centerX:
        assert(false, "Do not inset the center coordinate")
      case .centerY:
        assert(false, "Do not inset the center coordinate")
      }
      
      let metrics = ["insetSize":magnitude]
      constraints[option] = (NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: ["forView":view])[0])
      superview.addConstraint(constraints[option]!)
    }
    
    return constraints
  }
  
}
