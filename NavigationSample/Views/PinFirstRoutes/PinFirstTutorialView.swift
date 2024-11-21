import SwiftUI

struct PinFirstTutorialView: View {
    @ObservedObject var store: PinFirstTutorialStore
    @StateObject private var router = PinFirstTutorialRouter()
    
    var body: some View {
        VStack {
            TutorialUI(
                state: .init(
                    isCompleted: store.isCompleted,
                    pattern: .pinFirst
                ),
                dispatch: { action in
                    switch action {
                    case .next:
                        store.isCompleted = true
                        router.navigateToNext()
                    }
                }
            )
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let pinStore = router.pinStore {
                        PinFirstPinInputView(store: pinStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
