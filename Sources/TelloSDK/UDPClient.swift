import Foundation
import Network


public final class UDPClient {
    
    private var connection: NWConnection
    private var host: NWEndpoint.Host
    private var port: NWEndpoint.Port
    public var state: NWConnection.State = .setup
    
    public init(host: NWEndpoint.Host, port: NWEndpoint.Port) {
        self.host = host
        self.port = port
        
//        var x = 0
//        while(x<1000000000) {  x+=1 }
        
        self.connection = NWConnection(host: host, port: port, using: .udp)
        connection.stateUpdateHandler = {[weak self] in self?.state = $0}
        connection.start(queue: .global())
    

    }
 
   
    
    public func send(string: String,_ finished: @escaping (Result) -> Void) {
        typealias completion = NWConnection.SendCompletion
        connection.send(content: string.data(using: .utf8), completion: completion.contentProcessed(({ (NWError) in
            if (NWError == nil) {
                dump("\(string)")
                finished(.success)
                
                
                self.connection.receiveMessage { (data, context, isComplete, error) in
                    print("########### data \(data) context \(context) isComplete \(isComplete) error \(error)")
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
                
                
            } else {
                finished(.failure("#### ERROR! Error when data (Type: Data) sending. NWError: \n \(NWError!)"))
            }
        })))
    }
    
    func receive() {
        connection.receiveMessage { (data, context, isComplete, error) in
            print("########### data \(data) context \(context) isComplete \(isComplete) error \(error)")
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


