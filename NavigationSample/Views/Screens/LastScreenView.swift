import SwiftUI

struct LastScreenView: View {
    @ObservedObject var router: LastScreenRouter
    let screen: Screen
    
    var body: some View {
        ScreenTemplate(
            title: screen.title,
            showNextButton: false,
            router: router
        ) {
            VStack(spacing: 20) {
                Text("完了画面")
                
                Button(action: {
                    router.backToFlowPatternSelection()
                }) {
                    Text("フローパターン選択に戻る")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
    }
}
