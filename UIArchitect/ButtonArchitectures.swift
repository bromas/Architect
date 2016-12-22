//
//  ButtonArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public class func button (type: UIButtonType, inView view: UIView, construct: ((_ label: UIButton) -> Void)) -> UIButton {
    return self.custom(UIButton(type: type) as UIButton, inView: view, construct: construct)
  }
  
  public class func button (type: UIButtonType, inView view: UIView) -> UIButton {
    return self.custom(UIButton(type: type) as UIButton, inView: view)
  }
  
  public class func button (title: String, target: AnyObject?, action: Selector, inView view: UIView, construct: ((_ label: UIButton) -> Void)) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    return self.custom(button, inView: view, construct: construct)
  }
  
  public class func button (title: String, target: AnyObject?, action: Selector, inView view: UIView) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    return self.custom(button, inView: view)
  }
  
}
