import SwiftUI

struct LastScreenTemplate<R: RouterProtocol>: View {
    @ObservedObject var router: R
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
                    router.parentRouter?.backToFlowPatternSelection()
                }) {
                    Text("最初に戻る")
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
