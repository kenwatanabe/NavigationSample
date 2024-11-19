import SwiftUI

@main
struct NavigationFlowApp: App {
    @StateObject private var mainRouter = MainRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(mainRouter: mainRouter)
                .onAppear {
                    mainRouter.currentScreen = .flowPatternSelection
                }
        }
    }
}
