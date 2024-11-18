import SwiftUI

struct NumberBInputView: View {
    let router: Router
    
    var body: some View {
        ScreenTemplate(
            title: Screen.numberBInput.title,
            router: router
        )
    }
}
