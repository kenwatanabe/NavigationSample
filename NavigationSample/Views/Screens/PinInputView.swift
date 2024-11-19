import SwiftUI

struct PinInputView: View {
    @ObservedObject var router: PinInputRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.pinInput.title,
            showNextButton: true,
            router: router
        ) {
            Text("PIN入力画面")
        }
    }
}
