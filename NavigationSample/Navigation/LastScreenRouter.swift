import SwiftUI

final class LastScreenRouter: RouterProtocol {
    @Published var navigationActive = false
    weak var parentRouter: MainRouter?
    
    init(parentRouter: MainRouter) {
        self.parentRouter = parentRouter
    }
    
    func onNext() {
    }
    
    func backToFlowPatternSelection() {
        parentRouter?.backToFlowPatternSelection()
    }
}
