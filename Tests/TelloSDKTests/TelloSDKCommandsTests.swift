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
    
    func test_fly_up_20cm() {
        XCTAssertEqual(Command.fly(.direction(.up), cm: 20).rawValue, "up 20")
    }
    
    func test_fly_down_20cm() {
        XCTAssertEqual(Command.fly(.direction(.down), cm: 20).rawValue, "down 20")
    }
    
    func test_fly_left_20cm() {
        XCTAssertEqual(Command.fly(.direction(.left), cm: 20).rawValue, "left 20")
    }
    
    func test_fly_right_20cm() {
        XCTAssertEqual(Command.fly(.direction(.right), cm: 20).rawValue, "right 20")
    }
    
    func test_fly_right_doesnt_exceed_501cm_and_resets_to_20cm() {
        XCTAssertEqual(Command.fly(.direction(.right), cm: 501).rawValue, "right 20")
    }
    
    func test_fly_forward_20cm() {
        XCTAssertEqual(Command.fly(.forward, cm: 20).rawValue, "forward 20")
    }
    
    func test_fly_back_20cm() {
        XCTAssertEqual(Command.fly(.back, cm: 20).rawValue, "back 20")
    }
    
    func test_rotate_right_90degrees() {
        XCTAssertEqual(Command.rotate(.right, degrees: 90).rawValue, "cw 90")
    }
    
    func test_rotate_left_90degrees() {
        XCTAssertEqual(Command.rotate(.left, degrees: 90).rawValue, "ccw 90")
    }
    
    func test_rotate_right_doesnt_exceed_361degrees_and_resets_to_90degrees() {
        XCTAssertEqual(Command.rotate(.right, degrees: 361).rawValue, "cw 90")
    }
    
    func test_flipping_in_all_directions() {
        XCTAssertEqual(Command.flip(.left).rawValue, "l")
        XCTAssertEqual(Command.flip(.right).rawValue, "r")
        XCTAssertEqual(Command.flip(.forward).rawValue, "f")
        XCTAssertEqual(Command.flip(.back).rawValue, "b")
    }
    
    func test_stop() {
        XCTAssertEqual(Command.stop.rawValue, "stop")
    }
    
    func test_set_speed_to_10cm() {
        XCTAssertEqual(Command.speed(cm: 10).rawValue, "speed 10")
    }
    
}
