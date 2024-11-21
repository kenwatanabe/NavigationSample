import Foundation

final class PinFirstTutorialRouter: ObservableObject {
    @Published var isActive = false
    @Published var pinStore: PinFirstPinInputStore?
    
    func navigateToNext() {
        pinStore = PinFirstPinInputStore()
        isActive = true
    }
}
