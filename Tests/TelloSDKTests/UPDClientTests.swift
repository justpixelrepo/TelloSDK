//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 21/07/2021.
//

import XCTest
import TelloSDK

final class UPDClientTests: XCTestCase {
    
    func test_client_state_setup() {
        let client = UDPClient(host: "192.168.10.1", port: 8889)
        client.send(string: "command") { _ in }
        XCTAssertEqual(client.state, .setup)
    }
    
    func test_client_state_preparing_and_ready() {
        let client = UDPClient(host: "192.168.10.1", port: 8889)
        client.send(string: "command") { _ in }
        XCTAssertEqual(client.state, .preparing)
        XCTAssertEqual(client.state, .ready)
    }
    
    func test_client_init_tello_commands() {
        let client = UDPClient(host: "192.168.10.1", port: 8889)
        client.send(string: "command") { _ in }
        client.send(string: "takeoff") { _ in }
        client.send(string: "forward 100") { _ in }
        client.send(string: "back 100") { _ in }
        client.send(string: "land") { XCTAssertEqual($0, .success)}
    }
    
    func test_client_init_takeoff_and_emergency() {
        let client = UDPClient(host: "192.168.10.1", port: 8889)
        client.send(string: "command") { _ in }
        client.send(string: "takeoff") { _ in }
        client.send(string: "emergency") { XCTAssertEqual($0, .success)}
    }
    
}
