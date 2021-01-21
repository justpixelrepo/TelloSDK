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
            case. fly(<#T##move: Move##Move#>, cm: <#T##UInt#>)
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
    public enum Move {
        case forward
        case back
        case position(_ position: Position)
        case direction(_ direction: Direction)
    }
    

}
