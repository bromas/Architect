//
//  CommonArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/15/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public static func verticalScrollingStack(inView view: UIView, construct: ((scroll: UIScrollView, stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView!, UIStackView!) {
    
    let (scroll, stack) = Architect.scrollingStack(inView: view)
    stack.axis = .Vertical
    construct(scroll: scroll, stack: stack)
    
    return (scroll, stack)
  }
  
  public static func horizontalScrollingStack(inView view: UIView, construct: ((scroll: UIScrollView, stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView!, UIStackView!) {
    
    let (scroll, stack) = Architect.scrollingStack(inView: view)
    stack.axis = .Horizontal
    construct(scroll: scroll, stack: stack)
    
    return (scroll, stack)
  }
  
  public static func scrollingStack(inView view: UIView, construct: ((scroll: UIScrollView, stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView!, UIStackView!) {
    
    let scroll = Architect.custom(UIScrollView(), inView: view)
    
    let stack = Architect.stack(inView: scroll) {
      Constrain.inset($0, with: [.Left: 0, .Right: 0, .Top: 0, .Bottom: 0])
    }
    
    construct(scroll: scroll, stack: stack)
    
    return (scroll, stack)
  }

}
