# GEOCODER

A Swift geocoding project including :
- AppIcon to an iOS Project.
- Customizing LaunchScreen.storyboard.
- Embedding in a navigation controller.
- Segue between one view controller to another.
- A custom subclass for each of the `UIButton` and `UIlabel` class to support the V (View) in the MVC (Model-View-Controller).
- Forward and Reverse Geocoding.
- Usage of `UIStackView`.

### Environment

- XCode 7.2.1
- iOS 9.2

### Lessons Learned

##### AppIcon :
1. For AppIcon use png files, not jpeg/jpg files.
2. For iPhone, get the following dimensions ready (in pixels) : 29 x 29 (29pt 1x), 58 x 58 (29pt 2x), 87 x 87 (29pt 3x), 40 x 40 (40 pt 1x), 80 x 80 (40pt 2x), 120 x 120 (40pt 3x and 60pt 2x), 57 x 57 (57pt 1x), 114 x 114 (57pt 2x), and 180 x 180 (60pt 3x).
3. For iPad, on top of the above, get the following dimensions ready (in pixels): 50 x 50 (50pt 1x), 100 x 100 (50pt 2x), 72 x 72 (72pt 1x), 144 x 144 (72pt 2x), 76 x 76 (76pt 1x), 152 x 152 (76pt 2x) and 167 x 167 (83.5pt 2x).

##### LaunchScreen.storyboard:
1. Custom class can't be used for this screen.

##### Custom Subclass for `UIButton` and `UIlabel`:
1. Required initializer as the following:
```
required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ... // Put your code for customization here, can be invoking a function.
    }
```

##### UIStackView:
1. Do this before putting any constraints! All constraints will be lost once UIStackView is applied to objects.

##### Geocoding
Forward
- A custom subclass called `MapTask` will handle going to the google maps api to get the json object from the address (String) typed and parse it into latitude (Double) and longitude (Double).

Reverse
- To be populated
