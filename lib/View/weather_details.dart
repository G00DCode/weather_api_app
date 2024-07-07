import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/weather_viewmodel.dart';

import '../utils/weather_utils.dart'; // Import the utility function

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);
    final weather = weatherViewModel.weather;

    return Scaffold(
      body: weatherViewModel.loading
          ? Center(child: CircularProgressIndicator())
          : weather == null
          ? Center(child: Text(weatherViewModel.error))
          : Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getWeatherBackground(weather.icon)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(weather.city),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                  left: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${weather.temperature}°C',
                          style: TextStyle(
                            fontSize: 60.0,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              weather.condition,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            Image.network(
                              'http://openweathermap.org/img/wn/${weather.icon}.png',
                              width: 64,
                              height: 64,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoColumn(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: '${weather.humidity}%',
                    ),
                    _buildInfoColumn(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: '${weather.windSpeed} m/s',
                    ),
                    _buildInfoColumn(
                      icon: Icons.visibility,
                      label: 'Visibility',
                      value: '${weather.visibility} m',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildInfoColumn({required IconData icon, required String label, required String value}) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
