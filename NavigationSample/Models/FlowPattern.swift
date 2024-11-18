import Foundation

enum FlowPattern: Hashable {
    case numberBFirst
    case pinFirst
    case passwordFirst
    // case hogehoge追加していく
    
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
    
    var routes: [NavigationRoute] {
        switch self {
        case .numberBFirst:
            return NumberBFirstRoutes.getRoutes()
        case .pinFirst:
            return PinFirstRoutes.getRoutes()
        case .passwordFirst:
            return PasswordFirstRoutes.getRoutes()
        }
    }
}