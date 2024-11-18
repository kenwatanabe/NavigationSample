struct PasswordFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .tutorial,
                nextRoutes: [.init(screen: .passwordInput)],
                skipCondition: nil
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
