import SwiftUI

final class AgreementRouter: RouterProtocol {
    @Published var navigationActive = false
    weak var parentRouter: MainRouter?
    
    init(parentRouter: MainRouter) {
        self.parentRouter = parentRouter
    }
    
    func onNext() {
        parentRouter?.navigateToNext()
    }
}
