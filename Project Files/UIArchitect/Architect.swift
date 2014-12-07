//
//  Architect.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/10/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public typealias Construction = (forView: UIView) -> Void
public typealias ConstructLabel = (forView: UILabel) -> Void
public typealias ConstructTextView = (forView: UITextView) -> Void
public typealias ConstructButton = (forView: UIButton) -> Void
public typealias ConstructImageView = (forView: UIImageView) -> Void
public typealias ArchitectExtendedAttribute = (magnitude: Float, priority: Int, multiplier: Float)

public class Architect {
    
    public class func printDocumentation () -> Void {
        println("UIArchitect is a framework for simplifying view and layout generation.\n")
        println("Use the Architect class to call for the construction of different views.\n(Hint: Try calling class methods on Architect with the names of what you want to build.)\n")
    }
    
}
    