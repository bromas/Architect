###Architect
Architect is a framework for simplifying view and layout generation in swift.

####Installation
Using [Carthage](https://github.com/Carthage/Carthage) add
```shell
github "bromas/Architect"
```
to your Cartfile

### DSL

#### Architect

Use the Architect class to call for the construction of different views.

```swift
let label = Architect.label(inView: self.view)
```

This syntax constructs the label, adds it as a subview, and prepares it for autolayout. Architect contains constructors for standard UIViews, buttons, labels, imageViews, textViews, and textFields. You can also use your own initializer by calling the 'custom' Architect method.

```swift
let customSubclass = Architect.custom(SomeUIViewSubclass(), inView: self.view)
```

All Architect construction methods also accept a trailing block to configure the initialized view.

```swift
let label = Architect.label(inView: self.view) { (label) -> void in
  label.text = "Configure me!"
}
```

####Constrain

Use the Constrain class to add constraints to your views.

```swift
Constrain.size(label, with: [.Width: 200])
Constrain.center(label, with: [.Y, 0])
Constrain.center(label, from: imageView, with: [.X, 0])
```

The above code will set a width constraint, center the labels Y coord in the labels superview, and center the labels X coord relative to the specifed imageView.

Constrain           |  Effect
------------------  |  --------------------
size                |  setting width/height
inset               |  distance from superview
pin                 |  distance from sibling view
center              |  relative from center
align (todo)        |  relative from edge

####Combining

Architect shines when combining Architect and Constrain calls together.

Example using standard constraint code:
```swift
let aLabel = UILabel()
aLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
self.view.addSubview(aLabel)
let constraintX = NSLayoutConstraint(item: aLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
let constraintY = NSLayoutConstraint(item: aLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 60.0)
self.view.addConstraints([constraintX, constraintY])
aLabel.text = "Old Style"
```

Example using Architect:
```swift
Architect.label(inView: self.view) {
  Constrain.inset($0, with: [.Bottom : 60])
  Constrain.center($0, with: [.X : 0])
  $0.text = "Architect"
}
```

```
