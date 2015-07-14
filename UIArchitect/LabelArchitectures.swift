//
//  LabelArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class ArchitectLabel : UILabel {
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init () {
    super.init(frame: CGRectZero)
    self.numberOfLines = 0
  }
  
  override public func layoutSubviews() {
    self.preferredMaxLayoutWidth = self.frame.size.width
    super.layoutSubviews()
  }
  
}

extension Architect {
  
  public class func label (inView view: UIView, construct: ((label: UILabel) -> Void)) -> ArchitectLabel {
    return self.custom(ArchitectLabel(), inView: view, construct: construct)
  }
  
  public class func label (inView view: UIView) -> ArchitectLabel {
    let label = UILabel()
    label.numberOfLines = 0
    return self.custom(ArchitectLabel(), inView: view)
  }
  
}
