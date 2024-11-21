struct NumberBFirstRoutes {
    static func getRoutes() -> [NavigationRoute] {
        [
            NavigationRoute(
                screen: .numberBFirstTutorial,
                nextRoutes: [.init(screen: .numberBFirstNumberBInput)],
                skipCondition: { context in
                    context.shouldSkipTutorial
                }
            ),
            NavigationRoute(
                screen: .numberBFirstNumberBInput,
                nextRoutes: [.init(screen: .numberBFirstAgreement)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .numberBFirstAgreement,
                nextRoutes: [.init(screen: .numberBFirstPasswordInput)],
                skipCondition: nil
            ),
            NavigationRoute(
                screen: .numberBFirstPasswordInput,
                nextRoutes: [],
                skipCondition: nil
            )
        ]
    }
}
