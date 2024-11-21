import SwiftUI

struct PinFirstPinInputView: View {
    @ObservedObject var store: PinFirstPinInputStore
    @StateObject private var router = PinFirstPinInputRouter()
    
    var body: some View {
        VStack {
            PinInputUI(
                state: .init(
                    pin: store.pin,
                    isValid: store.isValid,
                    errorMessage: store.pin.isEmpty ? nil : (!store.isValid ? "4桁の数字を入力してください" : nil)
                ),
                dispatch: { action in
                    switch action {
                    case .updatePin(let pin):
                        store.updatePin(pin)
                    case .next:
                        router.navigateToNext()
                    }
                }
            )
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let agreementStore = router.agreementStore {
                        PinFirstAgreementView(store: agreementStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
