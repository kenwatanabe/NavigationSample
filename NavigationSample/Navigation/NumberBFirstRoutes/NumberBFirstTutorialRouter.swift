import Foundation

final class NumberBFirstTutorialRouter: ObservableObject {
    @Published var isActive = false
    @Published var numberBStore: NumberBFirstNumberBInputStore?
    
    func navigateToNext() {
        numberBStore = NumberBFirstNumberBInputStore()
        isActive = true
    }
}
