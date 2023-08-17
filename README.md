
# Movies App
A movie app made in Flutter with clean architecture using BLoC, Hive and the movie db API with Dependency Injection.

## Features
- Search feature
- favorites feature
- Popular movies
- Top rated movies
- Movie details
- Movie cast
- Pagination (Infinite scroll)
- Dark and Light theme
- Lists and Items Animations
- Unit Testing


## Overview
- The project is made following clean architecture concept by uncle Bob,
which split the project into independent layers.
- The project was made by using my skeleton for projects and custom components for faster development.
- The project is following Bloc state management that gives a better speration of business logic.
- Animations were applied to inhance User Experience.
- Dependency Injection was uesd in this project to improve the reusability of code, while reducing the frequency of needing to change a class.
- Unit Tests were performed in this project for one feature to demonstrate
the concept of Unit Testing.


## UI Concept
- I have created the UI based on requirements gathered from the document, I have done something similar to the reference screens but here is why this version is better.
- When you look at the main home screen, you kinda get nostalgia that you have seen this before, and that's right you have because the information/ sections on the screen are presented in a similar way to what Netflix does. This is a good thing in terms of user accessibility because at this point everyone is used to that interface, and it's easy to navigate things. Which means that this version of the app will have better user experience since we have positioned things based on a famous/ similar user interface.
- Other screens are very similar to what you wanted, just enhanced user experience, in terms of design interface I have chosen a shade of orange that is more towards the 'chrome yellow' it represents entertainment, fun and quirkiness which in my opinion this app should have and goes well with both light and dark mode.


## App Demonstration
- You can find screenshots and video recording of the app working in the screensots folder.


## Installation
### 1. Clone the repo
```bash
https://github.com/MohammadAlghafari/MoviesApp.git
```
### 2. Run pub get
```bash
flutter pub get
```
### 3. Run the app
```bash 
flutter run
```

## Packages
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [carousel_slider](https://pub.dev/packages/carousel_slider)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [dartz](https://pub.dev/packages/dartz)
- [dio](https://pub.dev/packages/dio)
- [equatable](https://pub.dev/packages/equatable)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- [get_it](https://pub.dev/packages/get_it)
- [go_router](https://pub.dev/packages/go_router)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [flutter_staggered_animations](https://pub.dev/packages/flutter_staggered_animations)
- [hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
- [path_provider](https://pub.dev/packages/path_provider)
- [readmore](https://pub.dev/packages/readmore)
- [shimmer](https://pub.dev/packages/shimmer)
- [stream_transform](https://pub.dev/packages/stream_transform)
- [url_launcher](https://pub.dev/packages/url_launcher)
