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
  
  required internal init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.aView.backgroundColor = .darkGrayColor()
    addScrollView(self.aView)
    let constraint = embedSomething()
    
    UIView.performWithoutAnimation() {
      self.view.layoutIfNeeded()
    }
    
    UIView.animateWithDuration(1.0) {
      constraint.constant = -100
      self.view.layoutIfNeeded()
    }
  }
  
  func addScrollView (toView: UIView) -> Void {
    self.scroll = Architect.custom(UIScrollView(), inView: toView) {
      Constrain.inset($0, with: [.Top: 0, .Left: 0, .Bottom: 100, .Right: 0])
      
      let yellowView = Architect.custom(ColorView(color: UIColor.yellowColor()), inView: $0) {
        Constrain.inset($0, with: [.Left: 0, .Top: 0, .Right: 0])
        Constrain.size($0, with: [.Height: 50, .Width: 600])
      }
      
      let orangeView = Architect.custom(ColorView(color: UIColor.orangeColor()), inView: $0) {
        Constrain.pin(top: $0, toBottom: yellowView, magnitude: 0.0)
        Constrain.inset($0, with: [.Left: 0, .Bottom: 0])
        Constrain.size($0, with: [.Width: 200, .Height: 600])
        self.addCenteredVerticalTextLabels($0, withWidth: 180)
      }
      
      Architect.custom(ColorView(color: UIColor.greenColor()), inView: $0) {
        Constrain.pin(left: $0, toRight: orangeView, magnitude: 0)
        Constrain.pin(top: $0, toBottom: yellowView, magnitude: 0)
        Constrain.inset($0, with: [.Right: 0, .Bottom: 0])
        let tField = Architect.textField(inView: $0) {
          Constrain.align(center: $0, with: [.X: 0, .Y: 0])
          Constrain.size($0, with: [.Width: 100])
          $0.textAlignment = .Center
          $0.placeholder = "wat"
        }
        
        let redView = Architect.custom(ColorView(color: .redColor()), inView: $0) {
          Constrain.pin(top: $0, toBottom: tField, magnitude: 8.0)
          Constrain.size($0, with: [.Width: 30])
          Constrain.equate(heightOf: $0, fromRatioToWidth: 2)
          Constrain.align(center: $0, with: [.X: 0])
        }
        
        Architect.custom(ColorView(color: .grayColor()), inView: $0) {
          Constrain.align(center: $0, with: [.X: 0])
          Constrain.equate($0, to: redView, withExtendedOptions: [.Width : (.Equal, 0.0, 4.0, .Required)])
          Constrain.equate($0, with: [.Height: 30])
          Constrain.pin(bottom: $0, toTop: redView, magnitude: 10.0)
        }
        
      }
    }
  }
  
  func addCenteredVerticalTextLabels(toView: UIView, withWidth: CGFloat) {
    let textContainer = Architect.view(inView: toView) {
      $0.backgroundColor = UIColor.purpleColor()
      Constrain.align(center: $0, with: [.X: 0, .Y: 0])
      Constrain.equate($0, with: [.Width: withWidth])
    }
    
    let first = Architect.label(inView: textContainer) {
      $0.text = "Here is some text that should be laid out in the orange column"
    }
    let second = Architect.label(inView: textContainer) {
      $0.text = "This should be easy to do and layout vertically using the Blueprint API"
    }
    let third = Architect.label(inView: textContainer) {
      $0.text = "Nice."
    }
    
    Blueprint.verticalLayout([first, second, third], inView: textContainer, spaced: 8.0, with: [.Top: 10, .Right: 10, .Bottom: 10, .Left: 10])
  }
  
  func embedSomething() -> NSLayoutConstraint {
    let controller = UIViewController()
    var constraint: NSLayoutConstraint?
    Architect.embed(controller, withParent: self, inView: self.view) { controller in
      controller.view.backgroundColor = UIColor.orangeColor()
      Constrain.inset(controller.view, with: [.Left: 20, .Right: 30])
      constraint = Constrain.pin(top: controller.view, toBottom: self.view, magnitude: 0.0)
      Constrain.equate(controller.view, with: [.Height: 200])
    }
    return constraint!
  }
  
}

