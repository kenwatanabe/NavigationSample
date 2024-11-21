import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var mainRouter: MainRouter
    
    var body: some View {
        Group {
            if let pattern = mainRouter.selectedPattern {
                switch pattern.initialScreen {
                case .numberBFirstTutorial:
                    NumberBFirstTutorialView(
                        store: NumberBFirstTutorialStore()
                    )
                case .pinFirstTutorial:
                    PinFirstTutorialView(
                        store: PinFirstTutorialStore()
                    )
                case .passwordFirstTutorial:
                    PasswordFirstTutorialView(
                        store: PasswordFirstTutorialStore()
                    )
                default:
                    EmptyView()
                }
            } else {
                FlowPatternSelectionView()
            }
        }
    }
}
