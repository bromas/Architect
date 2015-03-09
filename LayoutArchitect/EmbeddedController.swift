//
//  EmbeddedController.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 3/9/15.
//  Copyright (c) 2015 Brian Thomas. All rights reserved.
//

import Foundation
import UIKit

class EmbeddedController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    println("embedded loaded")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    println("embedded will appear")
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    println("embedded didAppear")
  }
}
