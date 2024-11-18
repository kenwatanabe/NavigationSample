import SwiftUI

struct RootView: View {
    @State private var currentRouter: Router
    
    init() {
        self._currentRouter = State(initialValue: Router(
            screen: .flowPatternSelection,
            context: NavigationContext(shouldSkipTutorial: false)
        ))
    }
    
    var body: some View {
        Group {
            if currentRouter.currentScreen == .flowPatternSelection {
                FlowPatternSelectionView()
            } else {
                ContentView(router: currentRouter)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .init("SwitchToContentView"))) { notification in
            if let router = notification.userInfo?["router"] as? Router {
                currentRouter = router
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .init("BackToFlowPatternSelection"))) { _ in
            currentRouter = Router(
                screen: .flowPatternSelection,
                context: NavigationContext(shouldSkipTutorial: false)
            )
        }
    }
}
