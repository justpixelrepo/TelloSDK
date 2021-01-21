import Foundation
import Network

public final class UDPClient {
    
    private var connection: NWConnection
    private var host: NWEndpoint.Host
    private var port: NWEndpoint.Port
    
    public init(host: NWEndpoint.Host, port: NWEndpoint.Port) {
        self.host = host
        self.port = port
        
//        var x = 0
//        while(x<1000000000) {  x+=1 }
        
        self.connection = NWConnection(host: host, port: port, using: .udp)
        _ = state()
        connection.start(queue: .global())
    

    }
    
    private func state() -> String {
        var info = ""
        connection.stateUpdateHandler = { state in
            switch state {
            case .setup:
                info = "#### setup"
            case let .waiting( error) :
                info = "#### waiting \(error)"
            case .preparing:
                info = "#### preparing"
            case .ready:
                info = "#### ready"
            case let .failed(error) :
                info = "#### waiting \(error)"
            case .cancelled:
                info = "#### cancelled"
            @unknown default:
                info = "#### unknown"
            }
            
        }
        print(info)
        return info
    }
    
    public func send(string: String,_ finished: @escaping (Result) -> Void) {
        typealias completion = NWConnection.SendCompletion
        connection.send(content: string.data(using: .utf8), completion: completion.contentProcessed(({ (NWError) in
            if (NWError == nil) {
                finished(.success)
                self.receive()
                
            } else {
                finished(.failure("#### ERROR! Error when data (Type: Data) sending. NWError: \n \(NWError!)"))
            }
        })))
    }
    
    func receive() {
        connection.receiveMessage { (data, context, isComplete, error) in
            if (isComplete) {
                print("#### Receive is complete")
                
                if (data != nil) {
                    let backToString = String(decoding: data!, as: UTF8.self)
                    print("#### Received message: \(backToString)")
                } else {
                    print("####Data == nil")
                }
            }
        }
    }
    
}
