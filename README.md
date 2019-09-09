# FocusTv
Library to create a `UIFocusGuide` with simple syntax.

## Example

* The goals in this example is navigate from origin button to destiny button:

![Screen Shot 2019-09-09 at 16 56 11](https://user-images.githubusercontent.com/39157101/64562178-c0e39580-d322-11e9-9ff3-8b669d5f804e.png)

* A code without FocusTv framework:

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
