import XCTest
import TelloSDK

final class TelloSDKCommandsTests: XCTestCase {
    
    func test_start_command() {
       XCTAssertEqual(Command.start.value, "command")
    }
    
    func test_takeoff_command() {
       XCTAssertEqual(Command.takeoff.value, "takeoff")
    }
    
}
