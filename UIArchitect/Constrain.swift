//
//  Grunt.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/14/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

open class Constrain {
  
  open class func printDocumentation () -> Void {
    print("The Constrain class generates and adds NSLayoutConstraints \n")
    print("--------------------------------------------")
    print("Pin - connects edges of sibling views")
    print("Inset - connects edges to the superview")
    print("Center - aligns the centers of the views specified")
    print("Size - set size attributes Width and Height")
  }
  
  open class func construct (_ bluePrints: [NSLayoutConstraint], inView view: UIView) -> Void {
    view.addConstraints(bluePrints)
  }
  
}
