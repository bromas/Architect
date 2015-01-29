//
//  UIView_Architect.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/12/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func preppedForAutoLayout (#inView: UIView) -> UIView {
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        inView.addSubview(self)
        return self
    }
    
    public class func autoLayoutView () -> UIView {
        var view = self()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }
    
    public class func autoLayoutView (inView superview: UIView) -> UIView {
        var view = self.autoLayoutView()
        superview.addSubview(view)
        return view
    }
    
}
