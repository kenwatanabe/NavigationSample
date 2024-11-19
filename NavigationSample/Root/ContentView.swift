import SwiftUI

struct ContentView: View {
    @ObservedObject var mainRouter: MainRouter
    
    var body: some View {
        NavigationView {
            Group {
                switch mainRouter.currentScreen {
                case .flowPatternSelection:
                    let router = FlowPatternSelectionRouter(parentRouter: mainRouter)
                    FlowPatternSelectionView(router: router)
                    
                case .tutorial:
                    buildScreen(
                        screen: .tutorial,
                        router: TutorialRouter(parentRouter: mainRouter),
                        normalView: TutorialView.init
                    )
                    
                case .numberBInput:
                    buildScreen(
                        screen: .numberBInput,
                        router: NumberBInputRouter(parentRouter: mainRouter),
                        normalView: NumberBInputView.init
                    )
                    
                case .pinInput:
                    buildScreen(
                        screen: .pinInput,
                        router: PinInputRouter(parentRouter: mainRouter),
                        normalView: PinInputView.init
                    )
                    
                case .agreement:
                    buildScreen(
                        screen: .agreement,
                        router: AgreementRouter(parentRouter: mainRouter),
                        normalView: AgreementView.init
                    )
                    
                case .passwordInput:
                    buildScreen(
                        screen: .passwordInput,
                        router: PasswordInputRouter(parentRouter: mainRouter),
                        normalView: PasswordInputView.init
                    )
                    
                case .none:
                    Text("画面が見つかりません")
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildScreen<R: RouterProtocol, V: View>(
        screen: Screen,
        router: R,
        normalView: (R) -> V
    ) -> some View {
        if mainRouter.isLastScreen(screen) {
            LastScreenTemplate(router: router, screen: screen)
        } else {
            normalView(router)
        }
    }
}
