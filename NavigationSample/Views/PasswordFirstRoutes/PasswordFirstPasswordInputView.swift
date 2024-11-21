import SwiftUI

struct PasswordFirstPasswordInputView: View {
    @ObservedObject var store: PasswordFirstPasswordInputStore
    @StateObject private var router = PasswordFirstPasswordInputRouter()
    
    var body: some View {
        VStack {
            PasswordInputUI(
                state: .init(
                    password: store.password,
                    confirmPassword: store.confirmPassword,
                    isValid: store.isValid,
                    errorMessage: !store.password.isEmpty && !store.isValid ? "パスワードが一致しません" : nil,
                    isLastScreen: false
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
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let agreementStore = router.agreementStore {
                        PasswordFirstAgreementView(store: agreementStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
