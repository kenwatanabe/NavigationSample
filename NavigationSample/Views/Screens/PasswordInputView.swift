import SwiftUI

struct PasswordInputView: View {
    let router: Router
    
    var body: some View {
        ScreenTemplate(
            title: Screen.passwordInput.title,
            router: router
        )
    }
}
