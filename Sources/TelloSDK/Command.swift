import Foundation

public enum Command {
    
    case start
    case takeoff
    case land
    case video(_ isOn: Bool = true)
    case emergency
    case fly(_ move: Move, cm: UInt)
//    case move(_ move: Move, cm: UInt)
//    case position(_ position: Position, cm: UInt)
    case flip(_ position: Position)
   
    var value: String {
            switch self {
            case .start: return "command"
            case .takeoff: return "takeoff"
            case let .fly(move, cm) : return "\(move.rawValue) \(cm)"
            case .land: return "land"
            case .video(let isOn): return isOn ? "streamon" : "streamoff"
            default : return "command"
        }
    }
    
    public enum Direction {
        case up
        case down
        case left
        case right
    }
    
    public enum Position {
        case x
        case y
        case z
    }
    
    public enum Rotation {
        case right
        case left
    }
    
    public enum Move: RawRepresentable {
        case forward
        case back
        case position(_ position: Position)
        case direction(_ direction: Direction)
        
        public typealias RawValue = String
        public init?(rawValue: RawValue) { return nil }
        
        public var rawValue: RawValue {
            switch self {
            case .forward: return "forward"
            case .back: return "back"
            default: return "no set"
            }
        }
    }
    

}
