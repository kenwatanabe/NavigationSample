import SwiftUI

final class PinInputRouter: RouterProtocol {
    @Published var navigationActive = false
    weak var parentRouter: MainRouter?
    
    init(parentRouter: MainRouter) {
        self.parentRouter = parentRouter
    }
    
    func onNext() {
        parentRouter?.navigateToNext()
    }
}
