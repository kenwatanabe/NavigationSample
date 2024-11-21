import SwiftUI

final class PasswordFirstAgreementRouter: ObservableObject {
    @Published var isActive = false
    @Published var pinStore: PasswordFirstPinInputStore?
    
    func navigateToNext() {
        pinStore = PasswordFirstPinInputStore()
        isActive = true
    }
}
