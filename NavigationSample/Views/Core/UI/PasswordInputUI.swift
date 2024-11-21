import SwiftUI

struct PasswordInputUI: View {
    struct ViewState {
        let password: String
        let confirmPassword: String
        let isValid: Bool
        let errorMessage: String?
        let isLastScreen: Bool
        
        static let empty = ViewState(
            password: "",
            confirmPassword: "",
            isValid: false,
            errorMessage: nil,
            isLastScreen: false
        )
    }
    
    enum Action {
        case updatePassword(String)
        case updateConfirmPassword(String)
        case next
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("パスワード", text: Binding(
                get: { state.password },
                set: { dispatch(.updatePassword($0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("パスワード（確認）", text: Binding(
                get: { state.confirmPassword },
                set: { dispatch(.updateConfirmPassword($0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let error = state.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
            
            Button(state.isLastScreen ? "完了" : "次へ") {
                dispatch(.next)
            }
            .disabled(!state.isValid)
            .frame(maxWidth: .infinity)
            .padding()
            .background(state.isValid ? (state.isLastScreen ? Color.green : Color.blue) : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("パスワード入力")
    }
}
