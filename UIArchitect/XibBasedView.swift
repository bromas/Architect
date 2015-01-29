//
//  ArchitectNibView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 8/2/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class XibBasedView : UIView {
    
    public var nibView : UIView?
    
    public override var backgroundColor : UIColor? {
        get {
            return nibView?.backgroundColor
        }
        set {
            nibView?.backgroundColor = newValue
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    override public init() {
        super.init()
    }
    
    func commonInitialization () -> Void {
        
        self.backgroundColor = UIColor.clearColor()
        var stringToMessWith = NSStringFromClass(self.classForCoder)
        var classArray = stringToMessWith.componentsSeparatedByString(".")
        var classString = classArray.last
        
        if let className = classString {
            let views = NSBundle.mainBundle().loadNibNamed(classString, owner: self, options: nil)
            assert(views.count > 0, "Could not find a nib to load")
            
            let possibleView = views.first as? UIView
            if let view = possibleView {
                self.nibView = view
                view.preppedForAutoLayout(inView: self)
                Grunt.construct(Blueprint.inset(edges: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), of: view), inView: self)
            }
        }
        
    }
    
}
