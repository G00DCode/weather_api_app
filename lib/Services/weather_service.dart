import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/weather_model.dart';

class WeatherService {
  Future<Weather> fetchWeather(String city) async {
    final apiKey = '8e7f84c8e1b4530092d2ff1bf99cb0c9';
    final url = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';


    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        print('Failed to load weather data: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Exception caught: $e');
      rethrow;
    }
  }
}