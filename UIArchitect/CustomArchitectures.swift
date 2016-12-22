//
//  CustomArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Architect {
  
  public class func custom<T>(_ customView: T, inView view: UIView, construct: ((_ view: T) -> Void)) -> T {
    let possibleViewSubclass = customView as? UIView
    if let viewSubclass = possibleViewSubclass {
      viewSubclass.preppedForAutoLayout(inView: view)
    }
    construct(customView)
    return customView
  }
  
  public class func custom<T>(_ customView: T, inView view: UIView) -> T {
    let possibleViewSubclass = customView as? UIView
    if let viewSubclass = possibleViewSubclass {
      viewSubclass.preppedForAutoLayout(inView: view)
    }
    return customView
  }
  
}
