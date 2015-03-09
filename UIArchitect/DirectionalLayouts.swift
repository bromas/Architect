//
//  DirectionalLayouts.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 3/9/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Grunt {
  public class func verticallyLayout(views: [UIView], inView: UIView, with: [BlueprintGuide: Float]) -> [UIView] {
    assert(with.indexForKey(.Top) != .None
      && with.indexForKey(.Right) != .None
      && with.indexForKey(.Bottom) != .None
      && with.indexForKey(.Left) != .None, "You must provide all edges for the insets of a vertical layout.")
    
    let count = views.count
    var lastManagedView: UIView?
    for (index, view) in enumerate(views) {
      switch count {
      case 1:
        Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      case 2:
        Constrain.inset(views[0], with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        Constrain.pin(top: views[1], toBottom: views[0], withMagnitude: 0.0)
        Constrain.inset(views[1], with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      default:
        switch index {
        case 0:
          Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        case 1...(count-2):
          Constrain.pin(top: view, toBottom: lastManagedView!, withMagnitude: 0.0)
          Constrain.inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!])
        case count-1:
          Constrain.pin(top: view, toBottom: lastManagedView!, withMagnitude: 0.0)
          Constrain.inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        default:
          Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        }
      }
      lastManagedView = view
    }
    return views
  }
  
  public class func verticallyLayout(views: [UIView], inView: UIView, spaced: Float, with: [BlueprintGuide: Float]) -> [UIView] {
    assert(with.indexForKey(.Top) != .None
      && with.indexForKey(.Right) != .None
      && with.indexForKey(.Bottom) != .None
      && with.indexForKey(.Left) != .None, "You must provide all edges for the insets of a vertical layout.")
    
    let count = views.count
    var lastManagedView: UIView?
    for (index, view) in enumerate(views) {
      Constrain.center(view, with: [.X: 0])
      switch count {
      case 1:
        Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      case 2:
        Constrain.inset(views[0], with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        Constrain.pin(top: views[1], toBottom: views[0], withMagnitude: spaced)
        Constrain.inset(views[1], with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
      default:
        switch index {
        case 0:
          Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!])
        case 1...(count-2):
          Constrain.pin(top: view, toBottom: lastManagedView!, withMagnitude: spaced)
          Constrain.inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!])
        case count-1:
          Constrain.pin(top: view, toBottom: lastManagedView!, withMagnitude: spaced)
          Constrain.inset(view, with: [.Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        default:
          Constrain.inset(view, with: [.Top: with[.Top]!, .Left: with[.Left]!, .Right: with[.Right]!, .Bottom: with[.Bottom]!])
        }
      }
      lastManagedView = view
    }
    return views
  }
  
}
