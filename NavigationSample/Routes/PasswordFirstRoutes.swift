struct PasswordFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .passwordFirstTutorial,
                nextRoutes: [.init(screen: .passwordFirstPasswordInput)],
                skipCondition: { context in
                    context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .passwordFirstPasswordInput,
                nextRoutes: [.init(screen: .passwordFirstAgreement)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .passwordFirstAgreement,
                nextRoutes: [.init(screen: .passwordFirstPinInput)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .passwordFirstPinInput,
                nextRoutes: [],
                skipCondition: nil
            )
        ]
    }
}
