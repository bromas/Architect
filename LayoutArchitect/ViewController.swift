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
    
    self.aView.backgroundColor = .darkGray
    addScrollView(self.aView)
    let constraint = embedSomething()
    
    UIView.performWithoutAnimation() {
      self.view.layoutIfNeeded()
    }
    
    UIView.animate(withDuration: 1.0, animations: {
      constraint.constant = -100
      self.view.layoutIfNeeded()
    }) 
  }
  
  func addScrollView (_ toView: UIView) -> Void {
    self.scroll = Architect.custom(UIScrollView(), inView: toView) {
      _ = Constrain.inset($0, with: [.top: 0, .left: 0, .bottom: 100, .right: 0])
      
      let yellowView = Architect.custom(ColorView(color: UIColor.yellow), inView: $0) {
        _ = Constrain.inset($0, with: [.left: 0, .top: 0, .right: 0])
        _ = Constrain.size($0, with: [.height: 50, .width: 600])
      }
      
      let orangeView = Architect.custom(ColorView(color: UIColor.orange), inView: $0) {
        _ = Constrain.pin(top: $0, toBottom: yellowView, magnitude: 0.0)
        _ = Constrain.inset($0, with: [.left: 0, .bottom: 0])
        _ = Constrain.size($0, with: [.width: 200, .height: 600])
        self.addCenteredVerticalTextLabels($0, withWidth: 180)
      }
      
      _ = Architect.custom(ColorView(color: UIColor.green), inView: $0) {
        _ = Constrain.pin(left: $0, toRight: orangeView, magnitude: 0)
        _ = Constrain.pin(top: $0, toBottom: yellowView, magnitude: 0)
        _ = Constrain.inset($0, with: [.right: 0, .bottom: 0])
        let tField = Architect.textField(inView: $0) {
          _ = Constrain.align(center: $0, with: [.x: 0, .y: 0])
          _ = Constrain.size($0, with: [.width: 100])
          $0.textAlignment = .center
          $0.placeholder = "wat"
        }
        
        let redView = Architect.custom(ColorView(color: .red), inView: $0) {
          _ = Constrain.pin(top: $0, toBottom: tField, magnitude: 8.0)
          _ = Constrain.size($0, with: [.width: 30])
          _ = Constrain.equate(heightOf: $0, fromRatioToWidth: 2)
          _ = Constrain.align(center: $0, with: [.x: 0])
        }
        
        _ = Architect.custom(ColorView(color: .gray), inView: $0) {
          _ = Constrain.align(center: $0, with: [.x: 0])
          _ = Constrain.equate($0, to: redView, withExtendedOptions: [.width : (.equal, 0.0, 4.0, .required)])
          _ = Constrain.equate($0, with: [.height: 30])
          _ = Constrain.pin(bottom: $0, toTop: redView, magnitude: 10.0)
        }
        
      }
    }
  }
  
  func addCenteredVerticalTextLabels(_ toView: UIView, withWidth: CGFloat) {
    let textContainer = Architect.view(inView: toView) {
      $0.backgroundColor = UIColor.purple
      _ = Constrain.align(center: $0, with: [.x: 0, .y: 0])
      _ = Constrain.equate($0, with: [.width: withWidth])
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
    
    _ = Blueprint.verticalLayout([first, second, third], inView: textContainer, spaced: 8.0, with: [.top: 10, .right: 10, .bottom: 10, .left: 10])
  }
  
  func embedSomething() -> NSLayoutConstraint {
    let controller = UIViewController()
    var constraint: NSLayoutConstraint?
    _ = Architect.embed(controller, withParent: self, inView: self.view) { controller in
      _ = controller.view.backgroundColor = UIColor.orange
      _ = Constrain.inset(controller.view, with: [.left: 20, .right: 30])
      constraint = Constrain.pin(top: controller.view, toBottom: self.view, magnitude: 0.0)
      _ = Constrain.equate(controller.view, with: [.height: 200])
    }
    return constraint!
  }
  
}

