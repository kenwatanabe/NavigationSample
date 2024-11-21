import Foundation

final class PinFirstPasswordInputStore: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isValid: Bool = false
    
    func updatePassword(_ password: String) {
        self.password = password
        validate()
    }
    
    func updateConfirmPassword(_ password: String) {
        self.confirmPassword = password
        validate()
    }
    
    private func validate() {
        isValid = !password.isEmpty && password == confirmPassword
    }
}
