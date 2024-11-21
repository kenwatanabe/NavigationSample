import SwiftUI

struct AgreementUI: View {
    struct ViewState {
        let isAgreed: Bool
        let hasReadToBottom: Bool
        let canProceed: Bool
        let errorMessage: String?
        
        static let empty = ViewState(
            isAgreed: false,
            hasReadToBottom: false,
            canProceed: false,
            errorMessage: nil
        )
    }
    
    enum Action {
        case updateAgreement(Bool)
        case updateReadStatus(Bool)
        case next
    }
    
    let state: ViewState
    let dispatch: (Action) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("利用規約")
                    .font(.headline)
                
                Text("利用規約の内容がここに入ります...")
                    .font(.body)
                
                GeometryReader { geometry in
                    Color.clear.onAppear {
                        dispatch(.updateReadStatus(true))
                    }
                }
                .frame(height: 1)
                
                Toggle("利用規約に同意する", isOn: Binding(
                    get: { state.isAgreed },
                    set: { dispatch(.updateAgreement($0)) }
                ))
                .padding(.vertical)
                
                if let error = state.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                Button("次へ") {
                    dispatch(.next)
                }
                .disabled(!state.canProceed)
                .frame(maxWidth: .infinity)
                .padding()
                .background(state.canProceed ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("利用規約")
    }
}
