//
//  ImageViewArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public class func imageView (inView view: UIView, construct: ((label: UIImageView) -> Void)) -> UIImageView {
    return self.custom(UIImageView(), inView: view, construct: construct)
  }
  
  public class func imageView (inView view: UIView) -> UIImageView {
    return self.custom(UIImageView(), inView: view)
  }
  
}
