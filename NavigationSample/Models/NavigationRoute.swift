struct NavigationRoute {
    struct NextRoute {
        let screen: Screen
        let condition: ((NavigationContext) -> Bool)?
        
        init(screen: Screen, condition: ((NavigationContext) -> Bool)? = nil) {
            self.screen = screen
            self.condition = condition
        }
    }
    
    let screen: Screen
    let nextRoutes: [NextRoute]
    let skipCondition: ((NavigationContext) -> Bool)?
}
