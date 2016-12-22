//
//  ArchitectNibView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 8/2/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

open class XibBasedView : UIView {
  
//  public var nibView : UIView?
//  
//  public override var backgroundColor : UIColor? {
//    get {
//      return nibView?.backgroundColor
//    }
//    set {
//      nibView?.backgroundColor = newValue
//    }
//  }
//  
//  required public init(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    self.commonInitialization()
//  }
//  
//  override public init(frame: CGRect) {
//    super.init(frame: frame)
//    self.commonInitialization()
//  }
//  
//  public init() {
//    super.init(frame: CGRectZero)
//    self.commonInitialization()
//  }
//  
//  func commonInitialization () -> Void {
//    
//    self.backgroundColor = .clearColor()
//    let stringToMessWith = NSStringFromClass(self.classForCoder)
//    let classArray = stringToMessWith.componentsSeparatedByString(".")
//    let classString = classArray.last
//    
//    if let className = classString {
//      let views = NSBundle.mainBundle().loadNibNamed(className, owner: self, options: nil)
//      assert(views.count > 0, "Could not find a nib to load")
//      
//      let possibleView = views.first as? UIView
//      if let view = possibleView {
//        self.nibView = view
//        view.preppedForAutoLayout(inView: self)
//        inset(view, with: [.Top: 0, .Right: 0, .Bottom: 0, .Left: 0])
//      }
//    }
//  }
  
}
