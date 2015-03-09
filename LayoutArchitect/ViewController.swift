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
  
  @IBOutlet var aView : UIView!
  var scroll : UIScrollView?
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addScrollView(self.aView)
    let constraint = embedSomething()
    
    UIView.performWithoutAnimation() {
      self.view.layoutIfNeeded()
    }
    
    UIView.animateWithDuration(2.0) {
      constraint.constant = 80
      self.view.layoutIfNeeded()
    }
  }
  
  func addScrollView (toView: UIView) -> Void {
    
    self.scroll = Architect.custom(UIScrollView(), inView: toView) {
      Grunt.inset($0, with: [.Top: 0, .Left: 0, .Bottom: 0, .Right: 0])
      
      let yellowView = Architect.custom(ColorView(color: UIColor.yellowColor()), inView: $0) {
        Constrain.inset($0, with: [.Left: 0, .Top: 0, .Right: 0])
        Grunt.size($0, with: [.Height: 50, .Width: 600])
      }
      
      let orangeView = Architect.custom(ColorView(color: UIColor.orangeColor()), inView: $0) {
        Grunt.pin(top: $0, toBottom: yellowView, withMagnitude: 0)
        Grunt.inset($0, with: [.Left: 0, .Bottom: 0])
        Grunt.size($0, with: [.Width: 200, .Height: 600])
        self.addCenteredVerticalTextLabels($0, withWidth: 180)
      }
      
      Architect.custom(ColorView(color: UIColor.greenColor()), inView: $0) {
        Grunt.pin(left: $0, toRight: orangeView, withMagnitude: 0)
        Grunt.pin(top: $0, toBottom: yellowView, withMagnitude: 0)
        Grunt.inset($0, with: [.Right: 0, .Bottom: 0])
        let firstLastView = Architect.custom(FirstLastNameXibView(), inView: $0) {
          Grunt.center($0, with: [.X: 0, .Y: 0])
          $0.configureWith(firstName: "John", lastName: "Doe")
        }
      }
    }
  }
  
//  func addZoomImageView (toView: UIView?) -> Void {
//    Architect.custom(ARCImageZoom(), inView: toView!) {
//      Grunt.inset($0, with: [.Top : 0, .Right : 0, .Bottom : 0, .Left: 0])
//      $0.image = UIImage(named: "eYCHy")
//    }
//  }
  
  func addCenteredVerticalTextLabels(toView: UIView, withWidth: Float) {
    let textContainer = Architect.view(inView: toView) {
      $0.backgroundColor = UIColor.purpleColor()
      Constrain.center($0, with: [.X: 0, .Y: 0])
      Constrain.size($0, with: [.Width: withWidth])
    }
    
    let first = Architect.label(inView: textContainer) {
      $0.text = "Here is some text that should be laid out in the orange column"
    }
    let second = Architect.label(inView: textContainer) {
      $0.text = "This should be easy to do and layout verticaslly using the Constrain API"
    }
    let third = Architect.label(inView: textContainer) {
      $0.text = "How do I look?"
    }
    
    Constrain.verticallyLayout([first, second, third], inView: textContainer, spaced: 8.0, with: [.Top: 10, .Right: 10, .Bottom: 10, .Left: 10])
  }
  
  func addCenteredFirstLastNameView(inView: UIView) -> FirstLastNameXibView {
    let firstLastView = Architect.custom(FirstLastNameXibView(), inView: inView) {
      Grunt.center($0, with: [.X: 0, .Y: 0])
      $0.configureWith(firstName: "John", lastName: "Doe")
    }
    return firstLastView
  }
  
  func embedSomething() -> NSLayoutConstraint {
    let controller = EmbeddedController()
    var constraint: NSLayoutConstraint?
    Architect.embed(controller, withParent: self, inView: self.view) {
      $0.view.backgroundColor = UIColor.darkGrayColor()
      constraint = Constrain.inset($0.view, with: [.Left: 20, .Right: 30, .Bottom: 10])[2]
      Constrain.size($0.view, with: [.Height: 200])
    }
    return constraint!
  }
  
}

