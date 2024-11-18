import SwiftUI

struct TutorialView: View {
    let router: Router
    
    var body: some View {
        ScreenTemplate(
            title: Screen.tutorial.title,
            router: router
        )
    }
}
