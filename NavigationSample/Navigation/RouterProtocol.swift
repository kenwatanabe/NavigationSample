import SwiftUI

protocol RouterProtocol: ObservableObject {
    var navigationActive: Bool { get set }
    var parentRouter: MainRouter? { get }
    func onNext()
    func onBack()
}

extension RouterProtocol {
    func onBack() {
        parentRouter?.goBack()
    }
}
