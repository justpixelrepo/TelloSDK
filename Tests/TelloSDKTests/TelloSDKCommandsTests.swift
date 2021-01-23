import XCTest
import TelloSDK

final class TelloSDKCommandsTests: XCTestCase {
    //validated takeoff command
    func test_start() {
       XCTAssertEqual(Command.start.value, "command")
    }
    
    func test_takeoff() {
       XCTAssertEqual(Command.takeoff.value, "takeoff")
    }
    
    func test_land() {
        XCTAssertEqual(Command.land.value, "land")
    }
    
    func test_video_is_on() {
        XCTAssertEqual(Command.video().value, "streamon")
    }
    
    
    
}
