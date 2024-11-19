import SwiftUI

struct NumberBInputView: View {
    @ObservedObject var router: NumberBInputRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.numberBInput.title,
            showNextButton: true,
            router: router
        ) {
            Text("番号B入力画面")
        }
    }
}
