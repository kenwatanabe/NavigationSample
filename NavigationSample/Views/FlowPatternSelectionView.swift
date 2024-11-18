import SwiftUI

struct FlowPatternSelectionView: View {
    @StateObject private var router: Router
    
    init() {
        _router = StateObject(wrappedValue: Router(
            screen: .flowPatternSelection,
            context: NavigationContext(shouldSkipTutorial: false)
        ))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("フローパターン選択")
                .font(.title)
                .padding()
            
            ForEach([FlowPattern.numberBFirst, .pinFirst, .passwordFirst], id: \.self) { pattern in
                Button(action: {
                    router.switchToFlow(pattern)
                }) {
                    Text(pattern.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}
