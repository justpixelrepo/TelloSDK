import Foundation
import Network

public final class Tello: CustomStringConvertible {
    
    public var description: String {
        return "Tello:: IP: 192.168.10.1"
    }
    
    let UDP_CMD_PORT = 8889
    let UDP_STATE_PORT = 8890
    let UDP_VS_PORT = 11111
    let TIME_BTW_COMMANDS = 0.5
    
    var state: STATE = .disconnected
    var client: UDPClient
    
    public init(port: NWEndpoint.Port) {
        client = UDPClient(host: "192.168.10.1", port: port)
    }
    
    public convenience init() {
        self.init(port: 8889)
    }
    
    public func send(_ command: Command, finished: @escaping (String) -> () = { _ in}) {
        client.send(string: command.rawValue) { result in
            finished("ok")
        }
    }
    
    public func send(_ commands: [Command], finished: @escaping (String) -> () = { _ in}) {
        //run all commands
        //exit when a command fails
        _ = commands.map {
            client.send(string: $0.rawValue) { result in
                finished("ok")
            }
        }
      
    }
    
}
