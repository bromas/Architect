//
//  ViewController.swift
//  LayoutArchitect
//
//  Created by Brian Thomas on 7/10/14.
//  Copyright (c) 2014 Brian Thomas. All rights reserved.
//

import UIKit
import Architect

class ViewController: UIViewController {
    
    @IBOutlet var aView : UIView?
    var scroll : UIScrollView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Architect.printDocumentation()
        Grunt.printDocumentation()
        Blueprint.printDocumentation()
        
        addScrollView(self.aView)
//        addZoomImageView(self.aView)
    }
    
    func addScrollView (toView: UIView?) -> Void {
        scroll = Architect.custom(UIScrollView(), inView: toView!) {
            Grunt.inset($0, with: [.Top: 0, .Left: 0, .Bottom: 0, .Right: 0])
            
            let yellowView = Architect.custom(ColorView(color: UIColor.yellowColor()), inView: $0) {
                Constrain.inset($0, with: [.Left: 0, .Top: 0, .Right: 0])
                Grunt.size($0, with: [.Height: 50, .Width: 600])
            }
            
            let orangeView = Architect.custom(ColorView(color: UIColor.orangeColor()), inView: $0) {
                Grunt.pin(top: $0, toBottom: yellowView, withMagnitude: 0)
                Grunt.inset($0, with: [.Left: 0, .Bottom: 0])
                Grunt.size($0, with: [.Width: 50, .Height: 750])
            }
            
            Architect.custom(ColorView(color: UIColor.greenColor()), inView: $0) {
                Grunt.pin(left: $0, toRight: orangeView, withMagnitude: 0)
                Grunt.pin(top: $0, toBottom: yellowView, withMagnitude: 0)
                Grunt.inset($0, with: [.Right: 0, .Bottom: 0])
                Architect.custom(FirstLastNameXibView(), inView: $0) {
                    Grunt.center($0, with: [.X: 0, .Y: 0])
                    $0.configureWith(firstName: "John", lastName: "Doe")
                }
//                self.loadRedView(inView: $0)
            }
        }
    }
    
    func addZoomImageView (toView: UIView?) -> Void {
        Architect.custom(ARCImageZoom(), inView: toView!) {
            Grunt.inset($0, with: [.Top : 0, .Right : 0, .Bottom : 0, .Left: 0])
            $0.image = UIImage(named: "eYCHy")
        }
    }
    
//    func loadRedView (#inView: UIView) -> Void {
//        
//        Architect.custom(ColorView(color: UIColor.redColor()), inView: inView) {
//            Grunt.inset($0, withOptions: [.Top: 10, .Left: 10, .Bottom: 10, .Right: 10])
//            let orangey = self.addOrangeViewToView($0)
//            self.addYellowView(toView: $0, parallelToView: orangey)
//        }
//    }
//    
//    func addOrangeViewToView (inView: UIView) -> UIView {
//        return Architect.custom(ColorView(color: UIColor.orangeColor()), inView: inView) {
//            Grunt.size($0, withOptions: [.Width: 50, .Height: 50])
//            Grunt.center($0, withOptions: [.Y: -10])
//            Grunt.inset($0, withOptions: [.Left: 10])
//        }
//    }
//    
//    func addYellowView (#toView: UIView, parallelToView :UIView) -> UIView {
//        return Architect.custom(SomeXibView(), inView: toView) {
//            Grunt.size(width: 50, ofView: $0)
//            Grunt.inset($0, withOptions: [.Right: 10])
//            Grunt.pin($0, toView: parallelToView, withOptions: [.Top : (.Top, 0), .Bottom: (.Bottom, 0)])
//            $0.backgroundColor = UIColor.yellowColor()
//        }
//    }
//    
//    func loadRedViewNewVersion (#insideView :UIView) -> Void {
//        
//        Architect.custom(ColorView(color: UIColor.redColor()), inView: insideView) {
//            Grunt.inset($0, withOptions: [.Top: 10, .Right: 10, .Bottom: 10, .Left: 10])
//            
//            Architect.label(inView: $0) {
//                Grunt.center($0, withOptions: [.X: 0, .Y: 0])
//                $0.text = "done"
//            }
//        }
//    }
//    
//    func loadRedViewOld (#inView: UIView) -> Void {
//        
//        var redView = ColorView(color: UIColor.redColor())
//        redView.setTranslatesAutoresizingMaskIntoConstraints(false)
//        inView.addSubview(redView)
//        inView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[redView]-(10)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["redView" :redView]))
//        inView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[redView]-(10)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["redView" :redView]))
//        
//        var theLabel = UILabel()
//        theLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
//        redView.addSubview(theLabel)
//        redView.addConstraint(NSLayoutConstraint(item: theLabel, attribute: .CenterX, relatedBy: .Equal, toItem: redView, attribute: .CenterX, multiplier: 1, constant: 0))
//        redView.addConstraint(NSLayoutConstraint(item: theLabel, attribute: .CenterY, relatedBy: .Equal, toItem: redView, attribute: .CenterY, multiplier: 1, constant: 0))
//        theLabel.text = "done."
//        
//    }
    
}

