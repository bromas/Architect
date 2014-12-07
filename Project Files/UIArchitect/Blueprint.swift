//
//  Blueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public typealias Blueprints = [NSLayoutConstraint]

public class Blueprint {
    public class func printDocumentation () -> Void {
        println("The Blueprint class generates [NSLayoutConstraint]s \n")
        println("Blueprint collections are generated using using keywords")
        println("--------------------------------------------")
        println("Pin - connects edges of sibling views")
        println("Inset - connects edges to the superview")
        println("Center - aligns the centers of the views specified")
        println("Size - set size attributes Width and Height")
    }
    
    class func assertSuperview(#forView: UIView?) {
        assert(forView!.superview != nil, "A view did not have a required superview.")
    }
}
