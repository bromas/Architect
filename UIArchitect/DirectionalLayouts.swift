//
//  DirectionalLayouts.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 3/9/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Blueprint {
  
  public class func verticallyLayout(views: [UIView], inView: UIView) -> [UIView] {
    return verticalLayout(views, inView: inView, spaced: 0.0, with: [.Top: 0, .Right: 0, .Bottom: 0, .Left: 0])
  }
  
  public class func verticallyLayout(views: [UIView], inView: UIView, with: [BlueprintGuide: CGFloat]) -> [UIView] {
    return verticalLayout(views, inView: inView, spaced: 0.0, with: with)
  }
  
  public class func verticalLayout(views: [UIView], inView: UIView, spaced: CGFloat, with: [BlueprintGuide: CGFloat]) -> [UIView] {
    assert(with.indexForKey(.Top) != .None
      && with.indexForKey(.Right) != .None
      && with.indexForKey(.Bottom) != .None
      && with.indexForKey(.Left) != .None, "You must provide all edges for the insets of a vertical layout.")
    
    let count = views.count
    var lastManagedView: UIView?
    for (index, view) in enumerate(views) {
      center(view, with: [.X: 0])
      switch count {
      case 1:
        inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      case 2:
        inset(views[0], with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        pin(top: views[1], toBottom: views[0], magnitude: CGFloat(spaced))
        inset(views[1], with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      default:
        switch index {
        case 0:
          inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        case 1...(count-2):
          pin(top: view, toBottom: lastManagedView!, magnitude: CGFloat(spaced))
          inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!])
        case count-1:
          pin((view, .Top), to: (lastManagedView!, .Bottom), magnitude: CGFloat(spaced))
          inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        default:
          inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        }
      }
      lastManagedView = view
    }
    return views
  }
  
}
