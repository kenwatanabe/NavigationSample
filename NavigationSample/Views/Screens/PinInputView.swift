import SwiftUI

struct PinInputView: View {
    let router: Router
    
    var body: some View {
        ScreenTemplate(
            title: Screen.pinInput.title,
            router: router
        )
    }
}
