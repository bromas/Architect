//
//  Grunt.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/14/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class Constrain {
  
  public class func printDocumentation () -> Void {
    println("The Blueprint class generates [NSLayoutConstraint]s \n")
    println("Blueprint collections are generated using using keywords")
    println("--------------------------------------------")
    println("Pin - connects edges of sibling views")
    println("Inset - connects edges to the superview")
    println("Center - aligns the centers of the views specified")
    println("Size - set size attributes Width and Height")
  }
  
  public class func construct (bluePrints: [NSLayoutConstraint], inView view: UIView) -> Void {
    view.addConstraints(bluePrints)
  }
  
}