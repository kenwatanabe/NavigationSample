struct NumberBFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .tutorial,
                nextRoutes: [.init(screen: .numberBInput)],
                skipCondition: { context in
                    return context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .numberBInput,
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
