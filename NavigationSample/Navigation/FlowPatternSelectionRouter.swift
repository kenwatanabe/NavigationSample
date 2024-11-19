import SwiftUI

final class FlowPatternSelectionRouter: RouterProtocol {
    @Published var navigationActive = false
    weak var parentRouter: MainRouter?
    
    init(parentRouter: MainRouter) {
        self.parentRouter = parentRouter
    }
    
    func onNext() {}
    
    func selectPattern(_ pattern: FlowPattern) {
        parentRouter?.start(with: pattern)
    }
}
