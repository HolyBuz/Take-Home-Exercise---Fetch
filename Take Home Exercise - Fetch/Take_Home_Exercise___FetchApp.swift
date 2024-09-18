import SwiftUI

@main
struct Fetch_TakeHomeExerciseApp: App {
    
    // Container for dependencies
    private final class DependencyContainer {
        
        private let networkManager: NetworkManager
        private let service: DessertsService
        let factory: DessertViewModelFactory
        
        init() {
            let decoder = JSONResponseDecoder()
            networkManager = NetworkManager(responseDecoder: decoder)
            service = DessertsService(networkManager: networkManager)
            factory = DefaultDessertViewModelFactory(service: service)
            
        }
    }

    private let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            DessertList(factory: container.factory)
        }
    }
}

