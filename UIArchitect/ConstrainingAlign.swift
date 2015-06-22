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

public func align(top view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
  return pin((view, .Top), to: (with, .Top), magnitude: constant)
}

public func align(left view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
  return pin((view, .Left), to: (with, .Left), magnitude: constant)
}

public func align(bottom view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
  return pin((view, .Bottom), to: (with, .Bottom), magnitude: constant)
}

public func align(right view: UIView, with: UIView, constant: CGFloat) -> NSLayoutConstraint {
  return pin((view, .Right), to: (with, .Right), magnitude: constant)
}

public func align(center view: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
  return align(center: view, from: view.superview!, with: attributes)
}

public func align(center view: UIView, from fromView: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
  
  let superview = commonSuperview(view, second: fromView)
  var constraints = CenterResult()
  
  for (option, magnitude) in attributes {
    switch option {
    case .X:
      constraints[.X] = (NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: fromView, attribute: .CenterX, multiplier: 1.0, constant: CGFloat(magnitude)))
      superview!.addConstraint(constraints[.X]!)
    case .Y:
      constraints[.Y] = (NSLayoutConstraint(item: view, attribute: .CenterY, relatedBy: .Equal, toItem: fromView, attribute: .CenterY, multiplier: 1.0, constant: CGFloat(magnitude)))
      superview!.addConstraint(constraints[.Y]!)
    }
  }
  
  return constraints
}
