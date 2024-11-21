import SwiftUI

struct FlowPatternSelectionUI: View {
    struct ViewState {
        let selectedPattern: FlowPattern?
        
        static let empty = ViewState(
            selectedPattern: nil
        )
    }
    
    enum Action {
        case selectPattern(FlowPattern)
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach([FlowPattern.numberBFirst, .pinFirst, .passwordFirst], id: \.self) { pattern in
                Button(action: {
                    dispatch(.selectPattern(pattern))
                }) {
                    Text(pattern.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(state.selectedPattern == pattern ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("フローパターン選択")
    }
}
