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
    case Top
    case Bottom
    case Left
    case Right
    case Center
    
    public func layoutAttribute () -> NSLayoutAttribute {
        switch self {
        case .Top:
            return NSLayoutAttribute.Top
        case .Right:
            return NSLayoutAttribute.Right
        case .Bottom:
            return NSLayoutAttribute.Bottom
        case .Left:
            return NSLayoutAttribute.Left
        case .Center:
            return NSLayoutAttribute.CenterX
        }
    }
    
    public func centerAttributeFromGuide (guide: BlueprintGuide) -> NSLayoutAttribute {
        switch self {
        case .Top:
            return NSLayoutAttribute.Top
        case .Right:
            return NSLayoutAttribute.Right
        case .Bottom:
            return NSLayoutAttribute.Bottom
        case .Left:
            return NSLayoutAttribute.Left
        case .Center:
            return NSLayoutAttribute.CenterX
        }
    }
}

public enum BlueprintMeasure {
    case Width
    case Height
}

public enum BlueprintCoordinate {
    case X
    case Y
}

public enum BlueprintPriority {
    case Required
    case High
    case Medium
    case Low
    
    public func float () -> Float {
        switch self {
        case .Required:
            return 1000.0
        case .High:
            return 750.0
        case .Medium:
            return 500.0
        case .Low:
            return 250.0
        }
    }
}

public enum BlueprintRelation {
    case Equal
    case GreaterThanOrEqual
    case LessThanOrEqual
    
    func string () -> String {
        switch self {
        case .Equal:
            return "=="
        case .GreaterThanOrEqual:
            return ">="
        case .LessThanOrEqual:
            return "<="
        }
    }
    
    public func layoutRelation () -> NSLayoutRelation {
        switch self {
        case .Equal:
            return NSLayoutRelation.Equal
        case .GreaterThanOrEqual:
            return NSLayoutRelation.GreaterThanOrEqual
        case .LessThanOrEqual:
            return NSLayoutRelation.LessThanOrEqual
        }
    }
}


