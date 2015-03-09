//
//  Grunt.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/14/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class Grunt {
    
    public class func printDocumentation () -> Void {
        println("The Grunt class handles applying blueprints to the view heirarchy.")
        println("If you don't need a pointer to any of the constraints it is best to let Grunt handle it.\n")
    }
    
    public class func construct (bluePrints: Blueprints, inView view: UIView) -> Void {
        view.addConstraints(bluePrints)
    }
}

public class Constrain : Grunt {
    
}