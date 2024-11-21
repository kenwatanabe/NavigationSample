import SwiftUI

struct PinFirstPasswordInputView: View {
    @ObservedObject var store: PinFirstPasswordInputStore
    @StateObject private var router = PinFirstPasswordInputRouter()
    
    var body: some View {
        VStack {
            PasswordInputUI(
                state: .init(
                    password: store.password,
                    confirmPassword: store.confirmPassword,
                    isValid: store.isValid,
                    errorMessage: !store.password.isEmpty && !store.isValid ? "パスワードが一致しません" : nil,
                    isLastScreen: true
                ),
                dispatch: { action in
                    switch action {
                    case .updatePassword(let password):
                        store.updatePassword(password)
                    case .updateConfirmPassword(let confirm):
                        store.updateConfirmPassword(confirm)
                    case .next:
                        router.navigateToNext()
                    }
                }
            )
        }
    }
}
