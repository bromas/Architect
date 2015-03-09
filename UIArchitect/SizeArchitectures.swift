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
  
  public class func size(view: UIView, with options: [BlueprintMeasure: Float]) -> [NSLayoutConstraint] {
    let constraints = Blueprint.size(view, with: options)
    view.addConstraints(constraints)
    return constraints
  }
  
  public class func size(view: UIView, withExtendedOptions options: [BlueprintMeasure: ExtendedSizeOptions]) -> [NSLayoutConstraint] {
    let constraints = Blueprint.size(view, withExtendedOptions: options)
    view.addConstraints(constraints)
    return constraints
  }
    
}