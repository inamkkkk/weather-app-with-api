import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    Provider.of<WeatherService>(context, listen: false).fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')), 
      body: Center(
        child: Consumer<WeatherService>(
          builder: (context, weatherService, child) {
            if (weatherService.weather == null) {
              return const CircularProgressIndicator();
            } else {
              Weather weather = weatherService.weather!;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('City: ${weather.cityName}', style: const TextStyle(fontSize: 24)),
                    Text('Temperature: ${weather.temperature}°C', style: const TextStyle(fontSize: 20)),
                    Text('Humidity: ${weather.humidity}%', style: const TextStyle(fontSize: 20)),
                    Text('Condition: ${weather.mainCondition}', style: const TextStyle(fontSize: 20)),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchWeather,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
