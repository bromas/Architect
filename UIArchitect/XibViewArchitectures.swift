//
//  XibViewArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/15/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation

extension Architect {
  
  public static func xib<T: UIView>(view: XibView<T>, construct: ((xib: T) -> Void) = { _ in }) throws -> T {
    let finalView = try view.build()
    construct(xib: finalView)
    return finalView
  }
  
}
