//
//  BlueprintOptions.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/19/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public enum BlueprintGuide {
  case top
  case bottom
  case left
  case right
  case centerX
  case centerY
  
  public func layoutAttribute () -> NSLayoutAttribute {
    switch self {
    case .top:
      return NSLayoutAttribute.top
    case .right:
      return NSLayoutAttribute.right
    case .bottom:
      return NSLayoutAttribute.bottom
    case .left:
      return NSLayoutAttribute.left
    case .centerX:
      return NSLayoutAttribute.centerX
    case .centerY:
      return NSLayoutAttribute.centerY
    }
  }
  
  public func centerAttributeFromGuide (_ guide: BlueprintGuide) -> NSLayoutAttribute {
    switch self {
    case .top:
      return NSLayoutAttribute.top
    case .right:
      return NSLayoutAttribute.right
    case .bottom:
      return NSLayoutAttribute.bottom
    case .left:
      return NSLayoutAttribute.left
    case .centerX:
      return NSLayoutAttribute.centerX
    case .centerY:
      return NSLayoutAttribute.centerY
    }
  }
}

public enum BlueprintMeasure {
  case width
  case height
}

public enum BlueprintCoordinate {
  case x
  case y
}

public enum BlueprintPriority {
  case required
  case high
  case medium
  case low
  
  public func float () -> Float {
    switch self {
    case .required:
      return 1000.0
    case .high:
      return 750.0
    case .medium:
      return 500.0
    case .low:
      return 250.0
    }
  }
}

public enum BlueprintRelation {
  case equal
  case greaterThanOrEqual
  case lessThanOrEqual
  
  func string () -> String {
    switch self {
    case .equal:
      return "=="
    case .greaterThanOrEqual:
      return ">="
    case .lessThanOrEqual:
      return "<="
    }
  }
  
  public func layoutRelation () -> NSLayoutRelation {
    switch self {
    case .equal:
      return NSLayoutRelation.equal
    case .greaterThanOrEqual:
      return NSLayoutRelation.greaterThanOrEqual
    case .lessThanOrEqual:
      return NSLayoutRelation.lessThanOrEqual
    }
  }
}
