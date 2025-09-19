import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService extends ChangeNotifier {
  Weather? _weather;
  Weather? get weather => _weather;

  String apiKey = 'YOUR_API_KEY';

  Future<void> fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      String? city = placemarks[0].locality;

      if (city != null) {
        final response = await http.get(Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));

        if (response.statusCode == 200) {
          _weather = Weather.fromJson(jsonDecode(response.body));
          notifyListeners();
        } else {
          throw Exception('Failed to load weather');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
