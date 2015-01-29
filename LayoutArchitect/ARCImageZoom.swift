//
//  ARCImageZoom.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 10/7/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class ARCImageZoom : UIScrollView, UIScrollViewDelegate {
    
    public var scrollView : UIScrollView?
    var imageView : UIImageView?
    public var image : UIImage? {
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
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sharedInitialization()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedInitialization()
    }
    
    public override init() {
        super.init()
    }
    
    private func sharedInitialization () -> Void {
        self.delegate = self
        self.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.minimumZoomScale = 0.5
        self.maximumZoomScale = 4.0
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.addSubview(self.imageView!)
    }
    
    public func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
