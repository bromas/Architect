//
//  ARCImageZoom.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 10/7/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

open class ARCImageZoom : UIScrollView, UIScrollViewDelegate {
    
    open var scrollView : UIScrollView?
    var imageView : UIImageView?
    open var image : UIImage? {
        get {
            return imageView?.image
        }
        set {
            imageView?.image = newValue
            if let actualSize = newValue?.size {
                imageView?.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: actualSize)
                self.contentSize = actualSize
                if let actualCenter = imageView?.center {
                    self.contentOffset = actualCenter
                }
            }
        }
    }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.sharedInitialization()
  }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedInitialization()
    }
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    fileprivate func sharedInitialization () -> Void {
        self.delegate = self
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.minimumZoomScale = 0.5
        self.maximumZoomScale = 4.0
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.addSubview(self.imageView!)
    }
    
    open func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
