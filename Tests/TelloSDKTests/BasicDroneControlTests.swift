import XCTest
import TelloSDK

final class BasicDroneControlTests: XCTestCase {
    
    var tello = Tello()
    
    func test_takeOff_land() {
        
        tello.send(.takeoff) { result in
            XCTAssertEqual(result, "ok")
        }
        
        tello.send(.land) { result in
            XCTAssertEqual(result, "ok")
        }
        
    }
    
    func test_multiple_commands() {
        tello.send([.takeoff, .wait(), .land])
    }
    
//    func test_multiple_commands() {
//        tello.send {
//            takeoff
//            wait()
//            land
//        }
//    }
    
    
}
