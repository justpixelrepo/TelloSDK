import XCTest
import TelloSDK

final class BasicDroneControlTests: XCTestCase {
    
    var tello = Tello()
    
    func test_takeOff_wait_land() {
        tello.send(.takeoff)
        tello.send(.wait(seconds: 3))
        tello.send(.land)
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
