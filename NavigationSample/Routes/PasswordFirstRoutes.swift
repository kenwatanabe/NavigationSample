struct PasswordFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .tutorial,
                nextRoutes: [.init(screen: .passwordInput)],
                skipCondition: { context in
                    context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .passwordInput,
                nextRoutes: [.init(screen: .agreement)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .agreement,
                nextRoutes: [.init(screen: .pinInput)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .pinInput,
                nextRoutes: [],
                skipCondition: nil
            )
        ]
    }
}
