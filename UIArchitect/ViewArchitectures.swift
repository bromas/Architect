//
//  ViewArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Architect {
    
    public class func view (inView view: UIView, construct: Construction) -> UIView {
        return self.custom(UIView(), inView: view, construct: construct)
    }
    
    public class func view (inView view: UIView) -> UIView {
        return self.custom(UIView(), inView: view)
    }
    
    public class func view (inView superview: UIView, withInsets insets: UIEdgeInsets) -> UIView {
        var view = UIView.autoLayoutView(inView: superview)
        Grunt.construct(Blueprint.inset(edges: insets, forView: view), inView: superview)
        return view
    }
    
}
