//
//  XibView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/15/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public enum XibLoadError: Error {
  case noSuchXib
}

public class XibView<T: UIView> {
  
  var ownerProperty: AnyObject?
  
  public static func build(owner: AnyObject!) throws -> T {
    let fullName: String = NSStringFromClass(T.self)
    let truncName = fullName.components(separatedBy: ".").last ?? ""
    let bundle = Bundle.main
    let xib = bundle.loadNibNamed(truncName, owner: owner, options: .none)
    if let result = xib?[0] as? T {
      return result
    } else {
      throw XibLoadError.noSuchXib
    }
  }
  
  public init (owner: AnyObject?) {
    self.ownerProperty = owner
  }
  
  public func build() throws -> T {
    let fullName: String = NSStringFromClass(T.self)
    let truncName = fullName.components(separatedBy: ".").last ?? ""
    let bundle = Bundle.main
    let xib = bundle.loadNibNamed(truncName, owner: ownerProperty, options: .none)
    if let result = xib?[0] as? T {
      return result
    } else {
      throw XibLoadError.noSuchXib
    }
  }
  
}
