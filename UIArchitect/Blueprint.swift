//
//  Blueprints.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/11/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

open class Blueprint {
  
}

public func assertSuperview(forView: UIView) -> UIView {
  let superview = forView.superview
  switch superview {
  case .some(let found):
    return found
  case .none:
    assert(false, "\(forView) did not have a required superview.")
  }
  return UIView()
}

public func assertCommonSuperview(_ forView: UIView, and andView: UIView) -> UIView {
  let superview = commonSuperview(forView, second: andView)
  switch superview {
  case .some(let found):
    return found
  case .none:
    assert(false, "\(forView) and \(andView) do not share a common superview.")
  }
  return UIView()
}

public func commonSuperview(_ first: UIView, second: UIView) -> UIView?
{
  var views = Set<UIView>()
  
  var firstTree: UIView? = first
  var secondTree: UIView? = second
  
  while (firstTree != .none || secondTree != .none) {
    switch firstTree {
    case let .some(view):
      if views.contains(view) {
        return view
      }
      views.insert(view)
      firstTree = view.superview
    case .none:
      assert(true, "")
    }
    
    switch secondTree {
    case let .some(view):
      if views.contains(view) {
        return view
      }
      views.insert(view)
      secondTree = view.superview
    case .none:
      assert(true, "")
    }
  }
  
  return .none
}
