import SwiftUI

struct TutorialView: View {
    @ObservedObject var router: TutorialRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.tutorial.title,
            showNextButton: true,
            router: router
        ) {
            Text("チュートリアル画面")
        }
    }
}
