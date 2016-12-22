//
//  EmbedArchitectures.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 3/9/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

extension Architect {
  public class func embed<T: UIViewController>(_ controller: T, withParent: UIViewController, inView: UIView, constructEmbed: (_ controllerIn: T) -> Void) -> T {
    withParent.addChildViewController(controller)
    controller.view.translatesAutoresizingMaskIntoConstraints = false
    inView.addSubview(controller.view)
    constructEmbed(controller)
    controller.didMove(toParentViewController: withParent)
    return controller
  }
}
