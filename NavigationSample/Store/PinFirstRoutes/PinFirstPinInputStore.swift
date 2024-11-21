import Foundation

final class PinFirstPinInputStore: ObservableObject {
    @Published var pin: String = ""
    @Published var isValid: Bool = false
    
    func updatePin(_ pin: String) {
        self.pin = pin
        validate()
    }
    
    private func validate() {
        isValid = pin.count == 4
    }
}
