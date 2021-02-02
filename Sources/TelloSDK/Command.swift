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
    case rotate(_ rotation: Rotation, degrees: UInt)
    case flip(_ flip: Flip)
    case stop
    case speed(cm: UInt)
    
    public var rawValue: RawValue {
        switch self {
        case .start: return "command"
        case .takeoff: return "takeoff"
        case let .fly(move, cm) :
            return "\(move.rawValue) \(20...500 ~= cm ? cm : 20)"
        case let .rotate(rotation, degrees) :
            return "\(rotation.rawValue) \(1...360 ~= degrees ? degrees : 90)"
        case .flip(let flip) : return "\(flip.rawValue)"
        case .land: return "land"
        case .video(let isOn): return isOn ? "streamon" : "streamoff"
        case .emergency: return "emergency"
        case .stop: return "stop"
        case .speed(let cm) : return "speed \(10...100 ~= cm ? cm : 10)"
        }
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
    
    public enum Flip: String {
        case left = "l"
        case right = "r"
        case forward = "f"
        case back = "b"
    }
    
    public enum Rotation: RawRepresentable {
        case right
        case left
        
        public typealias RawValue = String
        public init?(rawValue: RawValue) { return nil }
        
        public var rawValue: RawValue {
            switch self {
            case .left: return "ccw"
            case .right: return "cw"
            }
        }
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
            case .direction(.right): return "right"
            default: return "forward"
            }
        }
    }
    
    
}
