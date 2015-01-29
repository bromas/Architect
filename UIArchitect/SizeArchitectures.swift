//
//  SizeArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Grunt {
    
//    class func size(#width: Float?, height: Float?, ofView view: UIView) -> Void {
//        var constraints = [NSLayoutConstraint]()
//        if let widthArg = width {
//            constraints += Blueprint.size(view, withOptions: [.Width: widthArg])
//        }
//        if let heightArg = height {
//            constraints += Blueprint.size(view, withOptions: [.Height: heightArg])
//        }
//        view.addConstraints(constraints)
//    }
    
    public class func size(#width: Float, ofView view: UIView) -> Void {
        var constraints = [NSLayoutConstraint]()
        constraints += Blueprint.size(view, with: [.Width: width])
        view.addConstraints(constraints)
    }
    
    public class func size(#height: Float, ofView view: UIView) -> Void {
        var constraints = [NSLayoutConstraint]()
        constraints += Blueprint.size(view, with: [.Height: height])
        view.addConstraints(constraints)
    }
    
    public class func size(view: UIView, with options: [BlueprintMeasure: Float]) -> Void {
        view.addConstraints(Blueprint.size(view, with: options))
    }
    
    public class func size(view: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedSizeOptions]) -> Void {
        view.addConstraints(Blueprint.size(view, withExtendedOptions: options))
    }
    
}