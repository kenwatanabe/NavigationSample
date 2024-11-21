import SwiftUI

struct NumberBFirstNumberBInputView: View {
    @ObservedObject var store: NumberBFirstNumberBInputStore
    @StateObject private var router = NumberBFirstNumberBInputRouter()
    
    var body: some View {
        VStack {
            NumberBInputUI(
                state: .init(
                    numberB: store.numberB,
                    isValid: store.isValid,
                    errorMessage: store.numberB.isEmpty ? nil : (!store.isValid ? "番号Bを入力してください" : nil)
                ),
                dispatch: { action in
                    switch action {
                    case .updateNumberB(let number):
                        store.updateNumber(number)
                    case .next:
                        router.navigateToNext()
                    }
                }
            )
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let agreementStore = router.agreementStore {
                        NumberBFirstAgreementView(store: agreementStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
