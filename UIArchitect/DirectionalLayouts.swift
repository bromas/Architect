//
//  DirectionalLayouts.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 3/9/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Blueprint {
  
  public class func verticalLayout(_ views: [UIView], inView: UIView) -> [UIView] {
    return verticalLayout(views, inView: inView, spaced: 0.0, with: [.top: 0, .right: 0, .bottom: 0, .left: 0])
  }
  
  public class func verticalLayout(_ views: [UIView], inView: UIView, with: [BlueprintGuide: CGFloat]) -> [UIView] {
    return verticalLayout(views, inView: inView, spaced: 0.0, with: with)
  }
  
  public class func verticalLayout(_ views: [UIView], inView: UIView, spaced: CGFloat, with: [BlueprintGuide: CGFloat]) -> [UIView] {
    assert(with.index(forKey: .top) != .none
      && with.index(forKey: .right) != .none
      && with.index(forKey: .bottom) != .none
      && with.index(forKey: .left) != .none, "You must provide all edges for the insets of a vertical layout.")
    
    let count = views.count
    var lastManagedView: UIView?
    for (index, view) in views.enumerated() {
      _ = Constrain.align(center: view, with: [.x: 0])
      switch count {
      case 1:
        _ = Constrain.inset(view, with: [.top: with[.top]!, .left: with[.left]!, .right: with[.right]!, .bottom: with[.bottom]!])
      case 2:
        _ = Constrain.inset(views[0], with: [.top: with[.top]!, .left: with[.left]!, .right: with[.right]!])
        _ = Constrain.pin(top: views[1], toBottom: views[0], magnitude: spaced)
        _ = Constrain.inset(views[1], with: [.left: with[.left]!, .right: with[.right]!, .bottom: with[.bottom]!])
      default:
        switch index {
        case 0:
          _ = Constrain.inset(view, with: [.top: with[.top]!, .left: with[.left]!, .right: with[.right]!])
        case 1...(count-2):
          _ = Constrain.pin(top: view, toBottom: lastManagedView!, magnitude: spaced)
          _ = Constrain.inset(view, with: [.left: with[.left]!, .right: with[.right]!])
        case count-1:
          _ = Constrain.pin((view, .top), to: (lastManagedView!, .bottom), magnitude: CGFloat(spaced))
          _ = Constrain.inset(view, with: [.left: with[.left]!, .right: with[.right]!, .bottom: with[.bottom]!])
        default:
          _ = Constrain.inset(view, with: [.top: with[.top]!, .left: with[.left]!, .right: with[.right]!, .bottom: with[.bottom]!])
        }
      }
      lastManagedView = view
    }
    return views
  }
  
}
