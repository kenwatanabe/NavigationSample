import SwiftUI

struct ScreenTemplate: View {
    let title: String
    let router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .padding()
            
            if let currentScreen = router.currentScreen,
               router.isLastScreen(currentScreen) {
                Button("完了") {
                    router.backToFlowPatternSelection()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
            } else {
                Button("次へ") {
                    router.goToNext()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}
