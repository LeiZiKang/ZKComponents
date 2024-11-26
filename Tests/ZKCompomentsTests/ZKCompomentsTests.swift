import XCTest
import Testing
@testable import ZKCompoments
@testable import URL

final class ZKCompomentsTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
//        let name = .appDisplayName
//        let version = .appVersion
//        printf(name)
//        
//        let width = screenW
//        let height = screenH
//        
//        Device.current.screenSize
//        
//        let a = 28.3213123
//        let b: String  = a.twoDecimalPlacesStr()
//        printf(a.twoDecimalPlacesStr())
//        
//        let str = "https://github.com/"
//        let url: URL? = str.onlineUrl()
        
        let a = #URL("rdwerewrer")
    }
}

@Test func testRandomDate() async throws {
let date = Date.randomDate()
    #expect(date != nil)
}

@available(iOS 15.0, *)
@Test func testDateToString() async throws {
    let str = Date.now.toString()
    print(str)
}

