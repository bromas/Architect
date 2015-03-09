//
//  InsetArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Grunt {
  
  public class func inset (view: UIView, with options: [BlueprintGuide: Float]) -> [NSLayoutConstraint] {
    Blueprint.assertSuperview(forView: view)
    let constraints = Blueprint.inset(view, with: options)
    view.addConstraints(constraints)
    return constraints
  }
  
  public class func inset (view: UIView, withExtendedOptions options: [BlueprintGuide: (relation: BlueprintRelation, magnitude: Float, priority: BlueprintPriority)]) -> [NSLayoutConstraint] {
    Blueprint.assertSuperview(forView: view)
    let constraints = Blueprint.inset(view, withExtendedOptions: options)
    view.addConstraints(constraints)
    return constraints
  }
}