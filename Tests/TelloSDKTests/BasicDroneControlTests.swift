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
        var count = 0
        tello.send([.takeoff, .land]) {
            count += 1
            XCTAssertEqual(count, 1)
            XCTAssertEqual($0, "ok")
        }
    }
    
    func test_fly_up_and_down() {
        var count = 0
        tello.send([
            .takeoff,
            .fly(.direction(.up), cm: 200),
            .fly(.direction(.down), cm: 200),
            .land
        ]) {
            count += 1
            XCTAssertEqual(count, 1)
            XCTAssertEqual($0, "ok")
        }
    }
    
    func test_fly_forward_and_back() {
        var count = 0
        tello.send([
            .start,
            .takeoff,
            .fly(.forward, cm: 200),
            .fly(.back, cm: 200),
            .land
        ]) {
            count += 1
            XCTAssertEqual(count, 1)
            XCTAssertEqual($0, "ok")
        }
    }
    
//    func test_multiple_commands() {
//        tello.send {
//            takeoff
//            wait()
//            land
//        }
//    }
    
    
}
