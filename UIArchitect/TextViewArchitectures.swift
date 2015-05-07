//
//  TextViewArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public class func textView (inView view: UIView, construct: ((label: UITextView) -> Void)) -> UITextView {
    return self.custom(UITextView(), inView: view, construct: construct)
  }
  
  public class func textView (inView view: UIView) -> UITextView {
    return self.custom(UITextView(), inView: view)
  }
  
}
