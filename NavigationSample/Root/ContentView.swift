import SwiftUI

struct ContentView: View {
    @ObservedObject var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var body: some View {
        Group {
            switch router.currentScreen {
            case .flowPatternSelection:
                FlowPatternSelectionView()
            case .tutorial:
                TutorialView(router: router)
            case .numberBInput:
                NumberBInputView(router: router)
            case .pinInput:
                PinInputView(router: router)
            case .agreement:
                AgreementView(router: router)
            case .passwordInput:
                PasswordInputView(router: router)
            case .none:
                EmptyView()
            }
        }
        .onAppear {
            router.start()
        }
    }
}
