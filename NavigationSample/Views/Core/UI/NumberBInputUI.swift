import SwiftUI

struct NumberBInputUI: View {
    struct ViewState {
        let numberB: String
        let isValid: Bool
        let errorMessage: String?
        
        static let empty = ViewState(
            numberB: "",
            isValid: false,
            errorMessage: nil
        )
    }
    
    enum Action {
        case updateNumberB(String)
        case next
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("番号B", text: Binding(
                get: { state.numberB },
                set: { dispatch(.updateNumberB($0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            if let error = state.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
            
            Button("次へ") {
                dispatch(.next)
            }
            .disabled(!state.isValid)
            .frame(maxWidth: .infinity)
            .padding()
            .background(state.isValid ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("番号B入力")
    }
}
