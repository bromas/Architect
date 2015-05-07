//
//  Sample2.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/14/14.
//  Copyright (c) 2014 banditcastle. All rights reserved.
//

import UIKit
import Architect

class Sample2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Architect.printDocumentation()
//        Blueprint.printDocumentation()
        
        var centerGrey = Architect.custom(ColorView(color: UIColor.lightGrayColor()), inView: self.view) {
            Constrain.center($0, with: [.X: 0, .Y: 0])
            Constrain.size($0, withExtendedOptions: [.Width: (.Equal, 252, .Required), .Height: (.Equal, 159, .Required)])
        }
        
        var redTextContainer = Architect.custom(ColorView(color: UIColor.redColor()), inView: self.view) {
            Constrain.inset($0, with: [.Top: 60])
            Constrain.center($0, with: [.X: 0])
        }
        
    }
}
