import SwiftUI

struct FlowPatternSelectionView: View {
    @EnvironmentObject private var mainRouter: MainRouter
    @StateObject private var store = FlowPatternSelectionStore()
    
    var body: some View {
        FlowPatternSelectionUI(
            state: .init(
                selectedPattern: store.selectedPattern
            ),
            dispatch: { action in
                switch action {
                case .selectPattern(let pattern):
                    store.selectedPattern = pattern
                    mainRouter.start(with: pattern)
                }
            }
        )
        .navigationTitle("フローパターン選択")
    }
}
