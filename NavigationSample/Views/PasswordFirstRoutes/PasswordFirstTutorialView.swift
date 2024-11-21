import SwiftUI

struct PasswordFirstTutorialView: View {
    @ObservedObject var store: PasswordFirstTutorialStore
    @StateObject private var router = PasswordFirstTutorialRouter()
    
    var body: some View {
        VStack {
            TutorialUI(
                state: .init(
                    isCompleted: store.isCompleted,
                    pattern: .passwordFirst
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
                    if let passwordStore = router.passwordStore {
                        PasswordFirstPasswordInputView(store: passwordStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
