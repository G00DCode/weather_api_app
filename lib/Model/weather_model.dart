class Weather {
  final String city;
  final double temperature;
  final String condition;
  final String icon;
  final int humidity;
  final double windSpeed;
  final int visibility;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.visibility
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['main']['temp'],
      condition: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      visibility: json['visibility']
    );
  }
}
