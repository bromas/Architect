//
//  ConstrainingCenter.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 11/13/15.
//  Copyright © 2015 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Constrain {
  
  public static func center(view: UIView, with attributes: [BlueprintCoordinate: CGFloat]) -> CenterResult {
    return Constrain.align(center: view, from: view.superview!, with: attributes)
  }
  
}
