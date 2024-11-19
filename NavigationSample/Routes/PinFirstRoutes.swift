struct PinFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .tutorial,
                nextRoutes: [.init(screen: .pinInput)],
                skipCondition: { context in
                    context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .pinInput,
                nextRoutes: [.init(screen: .agreement)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .agreement,
                nextRoutes: [.init(screen: .passwordInput)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .passwordInput,
                nextRoutes: [],
                skipCondition: nil
            )
        ]
    }
}
