enum Screen: Hashable {
    case flowPatternSelection
    case tutorial
    case numberBInput
    case pinInput
    case agreement
    case passwordInput
    
    var title: String {
        switch self {
        case .flowPatternSelection: return "フローパターン選択"
        case .tutorial: return "チュートリアル"
        case .numberBInput: return "番号B入力"
        case .pinInput: return "4桁PIN入力"
        case .agreement: return "利用規約"
        case .passwordInput: return "パスワード入力"
        }
    }
}
