import Foundation
import Network

public enum Result: Equatable, CustomStringConvertible {
    case success
    case failure(String)
    
    public var description: String {
        switch self {
        case .success: return "ok"
        default: return "error"
        }
    }
}

