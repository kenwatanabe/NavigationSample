import SwiftUI

final class MainRouter: ObservableObject {
    @Published var currentScreen: Screen?
    @Published private(set) var selectedPattern: FlowPattern?
    private var routes: [NavigationRoute] = []
    private var navigationHistory: [Screen] = []
    var context: NavigationContext
    
    init() {
        self.context = NavigationContext(shouldSkipTutorial: false)
    }
    
    func backToFlowPatternSelection() {
        selectedPattern = nil
        currentScreen = .flowPatternSelection
        navigationHistory.removeAll()
        routes = []
    }
    
    func start(with pattern: FlowPattern) {
        selectedPattern = pattern
        routes = getRoutes(for: pattern)
        navigateToNext(from: nil)
    }
    
    private func getRoutes(for pattern: FlowPattern) -> [NavigationRoute] {
        switch pattern {
        case .numberBFirst:
            return NumberBFirstRoutes.getRoutes()
        case .pinFirst:
            return PinFirstRoutes.getRoutes()
        case .passwordFirst:
            return PasswordFirstRoutes.getRoutes()
        }
    }
    
    func navigateToNext() {
        navigateToNext(from: currentScreen)
    }
    
    private func navigateToNext(from screen: Screen?) {
        if screen == nil {
            let firstRoute = routes.first
            
            if let route = firstRoute,
               let skipCondition = route.skipCondition,
               skipCondition(context) {
                if let nextScreen = route.nextRoutes.first?.screen {
                    currentScreen = nextScreen
                    return
                }
            } else {
                if let route = firstRoute {
                    currentScreen = route.screen
                    return
                }
            }
        }
        
        let currentRoute = routes.first { $0.screen == (screen ?? .tutorial) }
        
        if let route = currentRoute {
            if let nextRoute = route.nextRoutes.first {
                navigationHistory.append(currentScreen ?? .flowPatternSelection)
                currentScreen = nextRoute.screen
            }
        }
    }
    
    
    
    func goBack() {
        if let previousScreen = navigationHistory.popLast() {
            currentScreen = previousScreen
            if previousScreen == .flowPatternSelection {
                selectedPattern = nil
                routes = []
            }
        } else {
            currentScreen = .flowPatternSelection
            selectedPattern = nil
            routes = []
        }
    }
    
    func canGoBack() -> Bool {
        !navigationHistory.isEmpty || (currentScreen != nil && currentScreen != .flowPatternSelection)
    }
    
    func isLastScreen(_ screen: Screen) -> Bool {
        guard let route = routes.first(where: { $0.screen == screen }) else {
            return false
        }
        return route.nextRoutes.isEmpty
    }
    
    
    
    func updateContext(shouldSkipTutorial: Bool) {
        context = NavigationContext(shouldSkipTutorial: shouldSkipTutorial)
    }
}
