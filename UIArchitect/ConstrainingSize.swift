//
//  SizeArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias SizeResult = [BlueprintMeasure: NSLayoutConstraint]
public typealias ExtendedSizeOptions = (relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)

import Foundation
import UIKit

extension Constrain {
  
//  public static func size(view: UIView, with options: [BlueprintMeasure: CGFloat]) -> SizeResult {
//    return size(view, with: options)
//  }
//  
//  public static func size(view: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedSizeOptions]) -> SizeResult {
//    return size(view, withExtendedOptions: options)
//  }
  
  public static func size(view: UIView, with options: [BlueprintMeasure: CGFloat]) -> SizeResult {
    var newOptions = [BlueprintMeasure: ExtendedSizeOptions]()
    for (measure, float) in options {
      let option = (BlueprintRelation.Equal, float, BlueprintPriority.Required)
      newOptions[measure] = option
    }
    return size(view, withExtendedOptions: newOptions)
  }
  
  public static func size(view: UIView , withExtendedOptions options: [BlueprintMeasure: (relation: BlueprintRelation, magnitude: CGFloat, priority: BlueprintPriority)]) -> SizeResult {
    
    var constraints = SizeResult()
    let views = ["view": view]
    
    for (attribute, with): (BlueprintMeasure, ExtendedSizeOptions) in options {
      let relation = with.relation.string()
      let priority = with.priority.float()
      switch attribute {
      case .Width:
        let metrics = ["width": with.magnitude]
        constraints[.Width] = (NSLayoutConstraint.constraintsWithVisualFormat("H:[view(\(relation)width@\(priority))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)[0])
        view.addConstraint(constraints[.Width]!)
      case .Height:
        let metrics = ["height": with.magnitude]
        constraints[.Height] = (NSLayoutConstraint.constraintsWithVisualFormat("V:[view(\(relation)height@\(priority))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)[0])
        view.addConstraint(constraints[.Height]!)
      }
    }
    
    return constraints
  }
  
}