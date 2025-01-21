import XCTest
import OSLog
import Foundation
@testable import SkipSample

let logger: Logger = Logger(subsystem: "SkipSample", category: "Tests")

@available(macOS 13, *)
final class SkipSampleTests: XCTestCase {

    func testSkipSample() throws {
        logger.log("running testSkipSample")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipSample", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
