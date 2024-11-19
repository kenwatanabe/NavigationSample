import SwiftUI

struct AgreementView: View {
    @ObservedObject var router: AgreementRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.agreement.title,
            showNextButton: true,
            router: router
        ) {
            Text("利用規約画面")
        }
    }
}
