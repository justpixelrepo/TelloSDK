import XCTest
import TelloSDK

final class TelloSDKTests: XCTestCase {
    
    func test_send_command_and_recieve_response() {
        let tello = Tello()
        tello.send(.start) { success in
            XCTAssertEqual(success, .ok)
        }
    }

    func testTello_Instance_withStart_andTakeOff() {
        let tello = Tello()
    //    tello.send(.start)
        tello.send(.takeoff) { success in
            XCTAssertEqual(success, .error)
        }
        
    }

    static var allTests = [
        ("test_send_command_and_recieve_response", test_send_command_and_recieve_response),
        ("testTello_Instance_withStart_andTakeOff", testTello_Instance_withStart_andTakeOff)
    ]
}
