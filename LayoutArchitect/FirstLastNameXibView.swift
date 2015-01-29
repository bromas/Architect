//
//  FirstLastNameXibView.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 10/7/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import Foundation
import Architect
import UIKit

class FirstLastNameXibView : XibBasedView {
    
    @IBOutlet var firstNameLabel : UILabel?
    @IBOutlet var lastNameLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init() {
        super.init()
    }
    
    func configureWith (#firstName :String, lastName :String) -> Void {
        firstNameLabel?.text = firstName
        lastNameLabel?.text = lastName
        self.layoutIfNeeded()
    }
    
}