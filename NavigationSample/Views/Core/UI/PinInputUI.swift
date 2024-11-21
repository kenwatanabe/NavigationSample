import SwiftUI

struct PinInputUI: View {
    struct ViewState {
        let pin: String
        let isValid: Bool
        let errorMessage: String?
        
        static let empty = ViewState(
            pin: "",
            isValid: false,
            errorMessage: nil
        )
    }
    
    enum Action {
        case updatePin(String)
        case next
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("PIN", text: Binding(
                get: { state.pin },
                set: { dispatch(.updatePin($0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .padding()
            
            Text("4桁の数字を入力してください")
                .foregroundColor(.gray)
            
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
        .navigationTitle("PIN入力")
    }
}
