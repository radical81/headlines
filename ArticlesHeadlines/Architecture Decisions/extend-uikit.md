#  Extend UIKit
---

### Status
Initial implementation.

### Context
The initial default way of implementing UIKit extensions.

### Decision
Reusable components that return an instance of a UIKit element with specific modifications are best done as an extension. For example, if I wanted an instancee of a UIAlertController with specific content, I would extend UIAlertController with static methods that can return a customised instance of that element.

### Consequences
This makes UIKit elements customisable, and then reusable.

    


