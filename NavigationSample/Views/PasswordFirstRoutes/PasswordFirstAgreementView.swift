import SwiftUI

struct PasswordFirstAgreementView: View {
    @ObservedObject var store: PasswordFirstAgreementStore
    @StateObject private var router = PasswordFirstAgreementRouter()
    
    var body: some View {
        VStack {
            AgreementUI(
                state: .init(
                    isAgreed: store.isAgreed,
                    hasReadToBottom: store.hasReadToBottom,
                    canProceed: store.canProceed,
                    errorMessage: !store.canProceed ? "パスワード規約を最後まで読み、同意してください" : nil
                ),
                dispatch: { action in
                    switch action {
                    case .updateAgreement(let agreed):
                        store.updateAgreement(agreed)
                    case .updateReadStatus(let hasRead):
                        store.updateReadStatus(hasRead)
                    case .next:
                        router.navigateToNext()
                    }
                }
            )
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let pinStore = router.pinStore {
                        PasswordFirstPinInputView(store: pinStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
