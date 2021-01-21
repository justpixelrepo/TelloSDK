import Foundation
import Network

public enum Result: CustomStringConvertible {
    case success
    case failure(String)
    
    public var description: String {
        switch self {
        case .success: return "success"
        default: return "error"
        }
    }
}

