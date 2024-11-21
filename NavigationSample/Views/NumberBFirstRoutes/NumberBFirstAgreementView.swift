import SwiftUI

struct NumberBFirstAgreementView: View {
    @ObservedObject var store: NumberBFirstAgreementStore
    @StateObject private var router = NumberBFirstAgreementRouter()
    
    var body: some View {
        VStack {
            AgreementUI(
                state: .init(
                    isAgreed: store.isAgreed,
                    hasReadToBottom: store.hasReadToBottom,
                    canProceed: store.canProceed,
                    errorMessage: !store.canProceed ? "番号B規約を最後まで読み、同意してください" : nil
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
                    if let passwordStore = router.passwordStore {
                        NumberBFirstPasswordInputView(store: passwordStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
