import SwiftUI

struct PasswordInputView: View {
    @ObservedObject var router: PasswordInputRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.passwordInput.title,
            showNextButton: true,
            router: router
        ) {
            Text("パスワード入力画面")
        }
    }
}
