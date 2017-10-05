# lifecake-swift

Clone project. Create separate branch, where all fixes will be committed. Commit your code after each fix.

•  project is converted to work with Xcode 9, Swift 4

•	using google is allowed

•	you should be able to explain any code changes

Feel free to ask if you have any questions or something is unclear.

Fixes:

1) app crashes on startup for iPhone 5 (iOS 9) but works on iPhone 6 (iOS 10). Why?
2) app loading time is too long, try to reduce it. There are several issues here. Try to scroll images - make sure app does not crash and there is no image flickering (one image is replaced by another one)
3) Try to tap some image to open it. Image layout is broken (part of the image is out of screen).
4) In image view we display when image was opened last time. It shows “no date”, if image was not opened before. Some why date is not refreshed, when you open image again and again.
5) If you close image view, ImageMeta is not released.

Features:

6) Start storing ViewController data source after first app launch. Use CoreData, sqlite or realm for that.
7) Lets change collection view layout to have similar pattern from TestLayout.xib file. Custom collection view layout should be used. Make sure that full width is used for iPhone screen sizes.
