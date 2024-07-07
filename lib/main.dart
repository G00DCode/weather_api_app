import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_app/ViewModel/weather_viewmodel.dart';
import 'Services/weather_service.dart';
import 'View/homescreen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherViewModel(),
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomeScreen(),
    );
  }
}
