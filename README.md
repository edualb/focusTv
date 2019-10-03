# FocusTv
A framework for creating `UIFocusGuide` elements with simple syntax.

## Example

* The goal of this example is navigate from an origin button to a destiny button:

![Screen Shot 2019-09-09 at 16 56 11](https://user-images.githubusercontent.com/39157101/64562178-c0e39580-d322-11e9-9ff3-8b669d5f804e.png)

* **Without** FocusTv framework:

```swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var destinyButton: UIButton!
    @IBOutlet weak var originButton: UIButton!
    
    private var focusGuideBottomRight: UIFocusGuide? = nil;
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.focusGuideBottomRight = UIFocusGuide()
      
      self.focusGuideBottomRight.widthAnchor.constraint(equalTo: destiny.widthAnchor).isActive = true
      self.focusGuideBottomRight.heightAnchor.constraint(equalTo: origin.heightAnchor).isActive = true
      self.focusGuideBottomRight.topAnchor.constraint(equalTo: origin.topAnchor).isActive = true
      self.focusGuideBottomRight.leadingAnchor.constraint(equalTo: destiny.leadingAnchor).isActive = true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
      super.didUpdateFocus(in: context, with: coordinator)
      guard let nextFocusedView = context.nextFocusedView else { return }
        
      switch nextFocusedView {
        case self.destinyButton:
            self.focusGuideBottomRight.preferredFocusEnvironments = [self.originButton]
        case self.originButton:
            self.focusGuideBottomRight.preferredFocusEnvironments = [self.destinyButton]
        default:
            self.focusGuideBottomRight.preferredFocusEnvironments = nil
      }
    }
}
```

* **With** FocusTv framework:

```swift
import UIKit
import FocusTv

class ViewController: UIViewController {
    @IBOutlet weak var destinyButton: UIButton!
    @IBOutlet weak var originButton: UIButton!
    
    private var focusGuideBottomRight: FocusTv? = nil;
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.focusGuideBottomRight = FocusTv(from: originButton, to: destinyButton)
      self.focusGuideBottomRight?.toBottomRight(view: self.view)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
      super.didUpdateFocus(in: context, with: coordinator)
      self.focusGuideBottomRight?.didUpdateFocus(in: context, with: coordinator)
    }
}
```

## How does it work?

1 - When a FocusTv object is created, we need to pass two parameters: an origin UIView and a destiny UIView. In other words, we give the FocusTv object a view that is the initial focus and another view that will be the final focus.

```swift
    self.focusGuideBottomRight = FocusTv(from: destinyButton, to: originButton)
```

2 - After the FocusTv object is created, we need pass the quadrant that will be the focus:

![Screen Shot 2019-09-09 at 16 56 11](https://user-images.githubusercontent.com/39157101/64563870-c04cfe00-d326-11e9-9602-1e5ea1df8914.png)

In our case, we want to pass the **bottom right quadrant** because when we drag to the right, the focus will go to the bottom right quadrant. 

To do this, add the following code:

```swift
    self.focusGuideBottomRight?.toBottomRight(view: self.view)
```

3 - And finally, to make it intelligent we add the `didUpdateFocus(in: context, with: coordinator)` method of the FocusTv object into the `override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)` method like this:

```swift
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
      super.didUpdateFocus(in: context, with: coordinator)
      self.focusGuideBottomRight?.didUpdateFocus(in: context, with: coordinator)
    }
```
