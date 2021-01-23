import XCTest
import TelloSDK

final class TelloSDKTests: XCTestCase {
    
    func test_send_command_and_recieve_response() {
        
        let tello = Tello()
        let exp = expectation(description: "should connect to drone")
        tello.send(.start) { success in
            XCTAssertEqual(success, .ok)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }

    func testTello_Instance_withStart_andTakeOff() {
        let tello = Tello()
        let exp = expectation(description: "should connect to drone")
        tello.send(.start)
        tello.send(.takeoff) { success in
            XCTAssertEqual(success, .error)
            
            exp.fulfill()
        }
        
     tello.send(.emergency)
        wait(for: [exp], timeout: 5.0)
        
    }
    
    func testTello_Instance_withStart_takeOff_flyForward_100cm_andLand() {
        let tello = Tello()
        tello.send(.start)
        tello.send(.takeoff)
        tello.send(.fly(.forward, cm: 30))
        tello.send(.emergency)
        
    }
}
