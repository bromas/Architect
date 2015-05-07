//
//  SomeXibView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 10/6/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import Architect
import UIKit

class SomeXibView : XibBasedView {
  
  @IBOutlet var theLabel : UILabel?
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    theLabel?.text = "From Storyboard"
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    theLabel?.text = "From Code"
  }
  
  override init() {
    super.init()
  }
  
  override func intrinsicContentSize() -> CGSize {
    return CGSize(width: 200, height: 200)
  }
  
}
