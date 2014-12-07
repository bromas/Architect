//
//  ImageViewArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/13/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
    
    public class func imageView (inView view: UIView, construct: ((label: UIImageView) -> Void)) -> UIImageView {
        return self.custom(UIImageView(), inView: view, construct: construct) as UIImageView
    }
    
    public class func imageView (inView view: UIView) -> UIImageView {
        return self.custom(UIImageView(), inView: view) as UIImageView
    }
    
    public class func imageView (inView superview: UIView, withInsets insets: UIEdgeInsets) -> UIImageView {
        var imageView = UIImageView.autoLayoutView(inView: superview)
        Grunt.construct(Blueprint.inset(edges: insets, forView: imageView), inView: superview)
        return imageView as UIImageView
    }
    
}
