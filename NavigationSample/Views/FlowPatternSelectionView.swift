import SwiftUI

struct FlowPatternSelectionView: View {
    @ObservedObject var router: FlowPatternSelectionRouter
    
    var body: some View {
        ScreenTemplate(
            title: Screen.flowPatternSelection.title,
            showNextButton: false,
            router: router
        ) {
            VStack(spacing: 20) {
                ForEach([FlowPattern.numberBFirst, .pinFirst, .passwordFirst], id: \.self) { pattern in
                    Button(action: {
                        router.selectPattern(pattern)
                    }) {
                        Text(pattern.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}
