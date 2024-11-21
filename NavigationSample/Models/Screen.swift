enum Screen: Hashable {
    // フロー選択
    case flowPatternSelection
    
    // NumberBFirst
    case numberBFirstTutorial
    case numberBFirstNumberBInput
    case numberBFirstAgreement
    case numberBFirstPasswordInput
    
    // PinFirst
    case pinFirstTutorial
    case pinFirstPinInput
    case pinFirstAgreement
    case pinFirstPasswordInput
    
    // PasswordFirst
    case passwordFirstTutorial
    case passwordFirstPasswordInput
    case passwordFirstAgreement
    case passwordFirstPinInput
    
    var title: String {
        switch self {
        case .flowPatternSelection:
            return "フローパターン選択"
            
        // NumberBFirst
        case .numberBFirstTutorial:
            return "チュートリアル"
        case .numberBFirstNumberBInput:
            return "番号B入力"
        case .numberBFirstAgreement:
            return "利用規約"
        case .numberBFirstPasswordInput:
            return "パスワード入力"
            
        // PinFirst
        case .pinFirstTutorial:
            return "チュートリアル"
        case .pinFirstPinInput:
            return "PIN入力"
        case .pinFirstAgreement:
            return "利用規約"
        case .pinFirstPasswordInput:
            return "パスワード入力"
            
        // PasswordFirst
        case .passwordFirstTutorial:
            return "チュートリアル"
        case .passwordFirstPasswordInput:
            return "パスワード入力"
        case .passwordFirstAgreement:
            return "利用規約"
        case .passwordFirstPinInput:
            return "PIN入力"
        }
    }
}
