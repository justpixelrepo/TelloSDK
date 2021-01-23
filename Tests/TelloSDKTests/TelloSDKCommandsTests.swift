import XCTest
import TelloSDK

final class TelloSDKCommandsTests: XCTestCase {
    //validated takeoff command
    func test_start() {
       XCTAssertEqual(Command.start.rawValue, "command")
    }
    
    func test_takeoff() {
       XCTAssertEqual(Command.takeoff.rawValue, "takeoff")
    }
    
    func test_land() {
        XCTAssertEqual(Command.land.rawValue, "land")
    }
    
    func test_video_is_on() {
        XCTAssertEqual(Command.video().rawValue, "streamon")
    }
    
    func test_video_is_off() {
        XCTAssertEqual(Command.video(false).rawValue, "streamoff")
    }
    
    func test_emergency() {
        XCTAssertEqual(Command.emergency.rawValue, "emergency")
    }
    
    
    
}
