# FocusTv
Framework to create a `UIFocusGuide` with simple syntax.

## Example

* The goals in this example is navigate from origin button to destiny button:

![Screen Shot 2019-09-09 at 16 56 11](https://user-images.githubusercontent.com/39157101/64562178-c0e39580-d322-11e9-9ff3-8b669d5f804e.png)

* A code **without** FocusTv framework:

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

* A code **with** FocusTv framework:

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

1 - When a FocusTv object is create, we need pass two parameters, an origin UIView and a destiny UIView. In other words, we set in FocusTv object a view that is initiate focus and other view that will be final focus.

```swift
    self.focusGuideBottomRight = FocusTv(from: destinyButton, to: originButton)
```

2 - After FocusTv object was create, we need pass the quadrant that will be the focus:

![Screen Shot 2019-09-09 at 16 56 11](https://user-images.githubusercontent.com/39157101/64563870-c04cfe00-d326-11e9-9602-1e5ea1df8914.png)

In our case, we wanna get the **bottom right quadrant** because when we drag to right, the focus will get the bottom right quadrant. 

For we do it, add this code:

```swift
    self.focusGuideBottomRight?.toBottomRight(view: self.view)
```

3 - And finally, for make the intelligent, we add `didUpdateFocus(in: context, with: coordinator)` method of FocusTv object into `override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)` method. Like it:

```swift
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
      super.didUpdateFocus(in: context, with: coordinator)
      self.focusGuideBottomRight?.didUpdateFocus(in: context, with: coordinator)
    }
```
