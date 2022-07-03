import XCTest
@testable import Localizable

final class LocalizableTests: XCTestCase {

    func testExample() throws {
        let url = URL(string: "https://github.com")!
        let text = Text("GitHub: \(url)")

        XCTAssertEqual(text, "GitHub: https://github.com")
    }
}
