//
//  Blueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

public class Blueprint {
  
}

public func assertSuperview(#forView: UIView) -> UIView {
  let superview = forView.superview
  switch superview {
  case .Some(let found):
    return found
  case .None:
    assert(false, "\(forView) did not have a required superview.")
  }
  return UIView()
}

public func assertCommonSuperview(forView: UIView, and andView: UIView) -> UIView {
  let superview = commonSuperview(forView, andView)
  switch superview {
  case .Some(let found):
    return found
  case .None:
    assert(false, "\(forView) and \(andView) do not share a common superview.")
  }
  return UIView()
}

public func commonSuperview(first: UIView, second: UIView) -> UIView?
{
  var views = Set<UIView>()
  
  var firstTree: UIView? = first
  var secondTree: UIView? = second
  
  while (firstTree != .None || secondTree != .None) {
    switch firstTree {
    case let .Some(view):
      if views.contains(view) {
        return view
      }
      views.insert(view)
      firstTree = view.superview
    case .None:
      assert(true, "")
    }
    
    switch secondTree {
    case let .Some(view):
      if views.contains(view) {
        return view
      }
      views.insert(view)
      secondTree = view.superview
    case .None:
      assert(true, "")
    }
  }
  
  return .None
}
