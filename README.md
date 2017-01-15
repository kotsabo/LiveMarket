# LiveMarket

For this application, i have used AlamofireObjectMapper library to handle the REST service and serialize the response to object. I have also used SwiftEventBus which is an event handler library. Finally, I have used PureLayout in order to manipulate some constraints more easily. All of them are open source libraries under MIT license.

I have used MVC architectural pattern. Although, for a project of this scale it wasn't a necessity, and it increases the number of classes, it makes it easier to handle changes and provides decoupled dependencies. 

This app includes:

1)polling mechanism to update rates every couple of seconds
2)spread calculation
3)rate display
  *only one fractional pip is displayed
  *the pip and the digit to its left are highlightened
4)the app looks nice on every screen, without depending on its size
5)two-three examples of tests are included
