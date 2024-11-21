import SwiftUI

struct TutorialUI: View {
    struct ViewState {
        let isCompleted: Bool
        let pattern: FlowPattern
        
        static let empty = ViewState(
            isCompleted: false,
            pattern: .numberBFirst
        )
    }
    
    enum Action {
        case next
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("チュートリアル画面")
                .font(.title)
            
            Text("選択したフロー: \(state.pattern.title)")
                .padding()
            
            Text("ここにチュートリアルの内容が入ります")
                .padding()
            
            Button("次へ") {
                dispatch(.next)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("チュートリアル")
    }
}
