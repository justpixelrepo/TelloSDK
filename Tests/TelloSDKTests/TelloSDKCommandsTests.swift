import XCTest
import TelloSDK

final class TelloSDKCommandsTests: XCTestCase {
    
    func test_start_command() {
       XCTAssertEqual(Command.start.value, "command")
    }
    

    
}
