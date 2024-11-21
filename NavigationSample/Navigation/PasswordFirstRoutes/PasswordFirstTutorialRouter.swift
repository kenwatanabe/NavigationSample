import Foundation

final class PasswordFirstTutorialRouter: ObservableObject {
    @Published var isActive = false
    @Published var passwordStore: PasswordFirstPasswordInputStore?
    
    func navigateToNext() {
        passwordStore = PasswordFirstPasswordInputStore()
        isActive = true
    }
}
