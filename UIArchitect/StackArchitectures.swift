//
//  StackArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/15/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public class func stack(inView view: UIView, construct: ((_ label: UIStackView) -> Void)) -> UIStackView {
    let stack = UIStackView()
    stack.axis = .vertical
    return self.custom(stack, inView: view, construct: construct)
  }
  
  public class func verticalStack(inView view: UIView, construct: ((_ label: UIStackView) -> Void)) -> UIStackView {
    let stack = UIStackView()
    stack.axis = .vertical
    return self.custom(stack, inView: view, construct: construct)
  }
  
  public class func horizontalStack(inView view: UIView, construct: ((_ label: UIStackView) -> Void)) -> UIStackView {
    let stack = UIStackView()
    stack.axis = .horizontal
    return self.custom(stack, inView: view, construct: construct)
  }
  
}
