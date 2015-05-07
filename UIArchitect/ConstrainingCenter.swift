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
    
    public class func center(view: UIView, from: UIView, with options: [BlueprintCoordinate: CGFloat]) -> CenterResult {
        return center(view, from: from, with: options)
    }
    
    public class func center(view: UIView, with options: [BlueprintCoordinate: CGFloat]) -> CenterResult {
        return center(view, with: options)
    }
    
}

public func center(view: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
  return center(view, from: view.superview!, with: attributes)
}

public func center(view: UIView, from fromView: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
  
  var constraints = CenterResult()
  
  for (option, magnitude) in attributes {
    switch option {
    case .X:
      constraints[.X] = (NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: fromView, attribute: .CenterX, multiplier: 1.0, constant: CGFloat(magnitude)))
      view.superview!.addConstraint(constraints[.X]!)
    case .Y:
      constraints[.Y] = (NSLayoutConstraint(item: view, attribute: .CenterY, relatedBy: .Equal, toItem: fromView, attribute: .CenterY, multiplier: 1.0, constant: CGFloat(magnitude)))
      view.superview!.addConstraint(constraints[.Y]!)
    }
  }
  
  return constraints
}
