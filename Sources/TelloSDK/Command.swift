import Foundation

public enum Command: RawRepresentable {
    
    public typealias RawValue = String
    public init?(rawValue: RawValue) { return nil }
    
    case start
    case takeoff
    case land
    case video(_ isOn: Bool = true)
    case emergency
    case fly(_ move: Move, cm: UInt)
//    case move(_ move: Move, cm: UInt)
//    case position(_ position: Position, cm: UInt)
    case flip(_ position: Position)
    case rotate(_ position: Position) //between 1-360
   
    public var rawValue: RawValue {
            switch self {
            case .start: return "command"
            case .takeoff: return "takeoff"
            case let .fly(move, cm) : return "\(move.rawValue) \(cm)"
            case .land: return "land"
            case .video(let isOn): return isOn ? "streamon" : "streamoff"
            case .emergency: return "emergency"
            default : return "command"
        }
    }
    
    private func range(cm: Int) -> Int {
        let rotationRange = 1...360
        let flyRange = 20...500
        return 10...100 ~= cm ? cm : 20
    }
    
    public enum Direction: RawRepresentable {
        case up
        case down
        case left
        case right
        
        public typealias RawValue = String
        public init?(rawValue: RawValue) { return nil }
        
        public var rawValue: RawValue {
            switch self {
            case .up: return "up"
            case .down: return "down"
            case .left: return "left"
            case .right: return "right"
            }
        }
        
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
            case .direction(.up): return "up"
            case .direction(.down): return "down"
            case .direction(.left): return "left"
            default: return "no set"
            }
        }
    }
    

}
