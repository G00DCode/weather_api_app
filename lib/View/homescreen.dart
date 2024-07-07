import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_app/View/weather_details.dart';
import '../ViewModel/weather_viewmodel.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  void _searchWeather() async {
    await Provider.of<WeatherViewModel>(context, listen: false)
        .fetchWeather(_controller.text);

    if (Provider.of<WeatherViewModel>(context, listen: false).error.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeatherDetailsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather App',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
              ),
              cursorColor: Colors.blueAccent,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _searchWeather,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Search',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 16),
            if (weatherViewModel.loading) CircularProgressIndicator(),
            if (weatherViewModel.error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  weatherViewModel.error,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
