# ZKCompoments

## Requirements：

ios 11, swift 5.10

## Usage

### `Color`

```swift
// UIKit: 
self.backgroundColor = UIColor(hexString: "#4B0082")
// swiftUI: 
Color(hexString: "#3498dbff")
```

#### Alpha
`.alpha` is a sugar for `colorWithAlphaComponent`, internally it does the exact same thing, think of it as a
lipstick for your implementation.
```swift
let colorWithAlpha = myColor.alpha(0.75)
```

#### Gradients
You can easily create gradient layers using the `gradient()` method on arrays with `UIColor`.
As an extra bonus, you can also add a transform closure if you want to modify the `CAGradientLayer`.

```swift
let gradient = [UIColor.blackColor(), UIColor.orangeColor()].gradient()

let secondGradient = [UIColor.blackColor(), UIColor.orangeColor()].gradient { gradient in
  gradient.locations = [0.25, 1.0]
  return gradient
}
```

#### Image colors
```swift
let image = UIImage(named: "My Image")
let (background, primary, secondary, detail) = image.colors()
```

## Thanks
https://github.com/zenangst/Hue 
https://github.com/Ekhoo/Device 
https://github.com/yannickl/DynamicColor 
