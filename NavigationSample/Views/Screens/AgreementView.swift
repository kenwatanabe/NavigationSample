import SwiftUI

struct AgreementView: View {
    let router: Router
    
    var body: some View {
        ScreenTemplate(
            title: Screen.agreement.title,
            router: router
        )
    }
}
