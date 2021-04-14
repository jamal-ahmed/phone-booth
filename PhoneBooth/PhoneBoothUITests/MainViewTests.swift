import XCTest

class MainViewTests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    func test_main_view_has_take_a_photo_button() {
        let takePhotoButton = app.otherElements["take_photo"]
        XCTAssertNotNil(takePhotoButton)
    }

    func test_main_view_has_view_photos_button() {
        let viewPhotosButton = app.otherElements["view_photos"]
        XCTAssertNotNil(viewPhotosButton)
    }

}
