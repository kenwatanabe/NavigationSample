import SwiftUI

@main
struct NavigationFlowApp: App {
    @StateObject private var mainRouter = MainRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(mainRouter)
            }
        }
    }
}
