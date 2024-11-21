struct PinFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .pinFirstTutorial,
                nextRoutes: [.init(screen: .pinFirstPinInput)],
                skipCondition: { context in
                    context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .pinFirstPinInput,
                nextRoutes: [.init(screen: .pinFirstAgreement)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .pinFirstAgreement,
                nextRoutes: [.init(screen: .pinFirstPasswordInput)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .pinFirstPasswordInput,
                nextRoutes: [],
                skipCondition: nil
            )
        ]
    }
}
