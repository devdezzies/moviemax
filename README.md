# MovieMax

MovieMax is an open-source mobile application that provides users with up-to-date information about movies, including details, trailers, ratings, and more. This app leverages the TMDB (The Movie Database) API to fetch and display movie data. It is built using Flutter for a cross-platform experience on both iOS and Android.

## Features

- **Discover Movies**: Browse the latest, popular, and top-rated movies.
- **Movie Details**: View detailed information about each movie, including the plot, cast, crew, and user ratings.
- **Search**: Find movies by title.
- **Trailers**: Watch movie trailers directly within the app.
- **Watchlist**: Save your favorite movies for quick access.

## Screenshots

![Home Screen](https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/devdezzies/moviemax.git
    cd moviemax
    ```

2. Install the dependencies:
    ```sh
    flutter pub get
    ```

3. Run the app:
    ```sh
    flutter run
    ```

## Setup

To use the TMDB API, you need to obtain an API key:

1. Sign up at [TMDB](https://www.themoviedb.org/).
2. Go to your account settings and navigate to the API section.
3. Apply for an API key and copy it.

Create a `.env` file in the root directory of your project and add your API key:
```env
API_TOKEN=your_api_key_here
```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Create a pull request.

## License 

This project is licensed under the MIT License

## Acknowledgements

- [Flutter](https://www.flutter.dev/) - for the cross-platform mobile framework 
- [TMDB](https://www.themoviedb.org/) - for the movie database API
- [Flutter Clean Architecture by Enes Akbal](https://medium.com/@enesakbal00/flutter-clean-architecture-part-1-introduction-f5dadf1bf3ee) - as the main learning resource for Flutter Clean Architecture

