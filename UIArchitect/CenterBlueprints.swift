//
//  CenterBlueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

public enum CenterAttribute {
    case X
    case Y
}

import Foundation
import UIKit

extension Blueprint {
    
    public class func center (view: UIView, fromCenterOfView fromView: UIView, withOffset offset: (x: Float, y: Float)) -> Blueprints {
        
        var xConstraint = NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: fromView, attribute: .CenterX, multiplier: 1.0, constant: CGFloat(offset.x))
        var yConstraint = NSLayoutConstraint(item: view, attribute: .CenterY, relatedBy: .Equal, toItem: fromView, attribute: .CenterY, multiplier: 1.0, constant: CGFloat(offset.y))
        
        return [xConstraint, yConstraint] as Blueprints
    }
    
    public class func center (view: UIView, fromView: UIView, with attributes: [BlueprintCoordinate: Float]) -> Blueprints {
        
        var constraints = [NSLayoutConstraint]()
        
        for (option, magnitude) in attributes {
            switch option {
            case .X:
                constraints.append(NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: fromView, attribute: .CenterX, multiplier: 1.0, constant: CGFloat(magnitude)))
            case .Y:
                constraints.append(NSLayoutConstraint(item: view, attribute: .CenterY, relatedBy: .Equal, toItem: fromView, attribute: .CenterY, multiplier: 1.0, constant: CGFloat(magnitude)))
            }
        }
        
        return constraints as Blueprints
    }
}
