//
//  CenterArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public typealias CenterResult = [BlueprintCoordinate: NSLayoutConstraint]

import Foundation
import UIKit

extension Constrain {
  
  public static func align(top view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
    return pin((view, .top), to: (with, .top), magnitude: constant)
  }
  
  public static func align(left view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
    return pin((view, .left), to: (with, .left), magnitude: constant)
  }
  
  public static func align(bottom view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
    return pin((view, .bottom), to: (with, .bottom), magnitude: constant)
  }
  
  public static func align(right view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
    return pin((view, .right), to: (with, .right), magnitude: constant)
  }
  
  public static func align(center view: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
    return align(center: view, from: view.superview!, with: attributes)
  }
  
  public static func align(center view: UIView, from fromView: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
    
    let superview = commonSuperview(view, second: fromView)
    var constraints = CenterResult()
    
    for (option, magnitude) in attributes {
      switch option {
      case .x:
        constraints[.x] = (NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: fromView, attribute: .centerX, multiplier: 1.0, constant: CGFloat(magnitude)))
        superview!.addConstraint(constraints[.x]!)
      case .y:
        constraints[.y] = (NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: fromView, attribute: .centerY, multiplier: 1.0, constant: CGFloat(magnitude)))
        superview!.addConstraint(constraints[.y]!)
      }
    }
    
    return constraints
  }
  
}
