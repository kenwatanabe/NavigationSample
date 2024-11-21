import Foundation

enum FlowPattern: Hashable {
    case numberBFirst
    case pinFirst
    case passwordFirst
    
    var title: String {
        switch self {
        case .numberBFirst:
            return "番号B優先フロー"
        case .pinFirst:
            return "PIN優先フロー"
        case .passwordFirst:
            return "パスワード優先フロー"
        }
    }
    
    var initialScreen: Screen {
        switch self {
        case .numberBFirst:
            return .numberBFirstTutorial
        case .pinFirst:
            return .pinFirstTutorial
        case .passwordFirst:
            return .passwordFirstTutorial
        }
    }
}
