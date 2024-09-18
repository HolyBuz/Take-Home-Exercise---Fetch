- **Overview**: I built the app using SwiftUI and following the MVVM pattern to maintain a clean separation of concerns and improve testability and scalability.

- **Dependency Injection**: To adhere to the Dependency Inversion Principle, I implemented a DependencyContainer class to manage the app's dependencies, decoupling the object creation from the business logic.

- **Network Layer**: The network layer is structured for scalability, with all components managed by the DessertsService, which sits in between the network layer and the ViewModel.

- **DessertViewModelFactory**: The DefaultDessertViewModelFactory is responsible for creating ViewModels for the views, adhering to the Factory Method Pattern.

- **DessertListViewModel**: - The DessertListViewModel fetches and sorts the list of desserts alphabetically, providing three @Published properties to manage the dessert list, loading state, and error state.

- **DessertDetailViewModel**: - The DessertDetailViewModel fetches and formats the details data for the dessert selected by the user, providing @Published properties to handle every state of the DessertDetail view.

- **Error Handling**: Error handling is simple but effective for a small-scale application, providing the user with a user-friendly alert when an error occurs.

- **Future Improvements**: Given more time, I would add unit and UI testing.

