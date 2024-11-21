import SwiftUI

struct NumberBFirstTutorialView: View {
    @ObservedObject var store: NumberBFirstTutorialStore
    @StateObject private var router = NumberBFirstTutorialRouter()
    
    var body: some View {
        VStack {
            TutorialUI(
                state: .init(
                    isCompleted: store.isCompleted,
                    pattern: .numberBFirst
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
                    if let numberBStore = router.numberBStore {
                        NumberBFirstNumberBInputView(store: numberBStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
