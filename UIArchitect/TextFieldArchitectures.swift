//
//  TextFieldArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 5/6/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public class func textField (inView view: UIView, construct: ((label: UITextField) -> Void)) -> UITextField {
    return self.custom(UITextField(), inView: view, construct: construct)
  }
  
  public class func textField (inView view: UIView) -> UITextField {
    return self.custom(UITextField(), inView: view)
  }
  
}