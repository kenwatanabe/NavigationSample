import SwiftUI

struct ScreenTemplate<Content: View>: View {
    let title: String
    let showNextButton: Bool
    let router: (any RouterProtocol)?
    let content: () -> Content
    
    var body: some View {
        VStack(spacing: 20) {
            content()
            
            if showNextButton,
               let router = router {
                Button(action: {
                    router.onNext()
                }) {
                    Text("次へ")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let router = router,
                   let mainRouter = router.parentRouter,
                   mainRouter.canGoBack() {
                    Button(action: {
                        mainRouter.goBack()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("戻る")
                        }
                    }
                }
            }
        }
    }
}
