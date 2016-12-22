//
//  CommonArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/15/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public static func verticalScrollingStack(inView view: UIView, construct: ((_ scroll: UIScrollView, _ stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView, UIStackView) {
    
    let (scroll, stack) = Architect.scrollingStack(inView: view)
    stack.axis = .vertical
    construct(scroll, stack)
    
    return (scroll, stack)
  }
  
  public static func horizontalScrollingStack(inView view: UIView, construct: ((_ scroll: UIScrollView, _ stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView, UIStackView) {
    
    let (scroll, stack) = Architect.scrollingStack(inView: view)
    stack.axis = .horizontal
    construct(scroll, stack)
    
    return (scroll, stack)
  }
  
  public static func scrollingStack(inView view: UIView, construct: ((_ scroll: UIScrollView, _ stack: UIStackView) -> Void) = { _ in }) -> (UIScrollView, UIStackView) {
    
    let scroll = Architect.custom(UIScrollView(), inView: view)
    
    let stack = Architect.stack(inView: scroll) {
      _ = Constrain.inset($0, with: [.left: 0, .right: 0, .top: 0, .bottom: 0])
    }
    
    construct(scroll, stack)
    
    return (scroll, stack)
  }

}
