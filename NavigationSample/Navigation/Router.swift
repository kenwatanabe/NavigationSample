import SwiftUI

final class Router: ObservableObject {
    @Published private(set) var currentScreen: Screen?
    @Published private(set) var navigationHistory: [Screen] = []
    
    private var routes: [NavigationRoute]
    private var context: NavigationContext
    private var currentFlowPattern: FlowPattern?
    
    init(screen: Screen, context: NavigationContext) {
        self.currentScreen = screen
        self.routes = []
        self.context = context
    }
    
    init(flowPattern: FlowPattern, context: NavigationContext) {
        self.routes = flowPattern.routes
        self.context = context
        self.currentFlowPattern = flowPattern
    }
    
    func switchToFlow(_ pattern: FlowPattern) {
        let newRouter = Router(flowPattern: pattern, context: self.context)
        newRouter.start()
        
        NotificationCenter.default.post(
            name: .init("SwitchToContentView"),
            object: nil,
            userInfo: ["router": newRouter]
        )
    }
    
    func start() {
        navigate(to: routes.first?.screen)
    }
    
    func navigate(to screen: Screen?) {
        guard let screen = screen else { return }
        
        if let currentScreen = currentScreen {
            navigationHistory.append(currentScreen)
        }
        
        guard let route = routes.first(where: { $0.screen == screen }) else {
            currentScreen = screen
            return
        }
        
        if let skipCondition = route.skipCondition,
           skipCondition(context) {
            if let nextScreen = route.nextRoutes.first?.screen {
                navigate(to: nextScreen)
                return
            }
        }
        
        currentScreen = screen
    }
    
    func goToNext() {
        guard let currentScreen = currentScreen,
              let currentRoute = routes.first(where: { $0.screen == currentScreen }),
              let nextRoute = currentRoute.nextRoutes.first else {
            return
        }
        
        navigate(to: nextRoute.screen)
    }
    
    func isLastScreen(_ screen: Screen) -> Bool {
        guard let route = routes.first(where: { $0.screen == screen }) else {
            return false
        }
        return route.nextRoutes.isEmpty
    }
    
    func backToFlowPatternSelection() {
        NotificationCenter.default.post(
            name: .init("BackToFlowPatternSelection"),
            object: nil
        )
    }
}
