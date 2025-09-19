# Weather App

A simple weather application built with Flutter that fetches weather data from a public API (OpenWeatherMap).

## Features

*   Displays current temperature.
*   Shows humidity.
*   Presents an icon representing the weather type.

## Getting Started

1.  Clone the repository.
2.  Obtain an API key from [OpenWeatherMap](https://openweathermap.org/).
3.  Replace `YOUR_API_KEY` in `lib/services/weather_service.dart` with your actual API key.
4.  Run `flutter pub get` to install dependencies.
5.  Run the app using `flutter run`.

## Folder Structure


lib/
├── main.dart
├── models/
│   └── weather_model.dart
├── screens/
│   └── weather_screen.dart
└── services/
    └── weather_service.dart


## State Management

This app uses the Provider package for state management.
