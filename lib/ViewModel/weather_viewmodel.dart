import 'package:flutter/material.dart';
import '../Model/weather_model.dart';
import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  Weather? _weather;
  Weather? get weather => _weather;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  Future<void> fetchWeather(String city) async {
    _loading = true;
    _error = '';
    notifyListeners();

    try {
      final weather = await WeatherService().fetchWeather(city);
      _weather = weather;
    } catch (e) {
      _error = 'Error fetching weather data: $e';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

