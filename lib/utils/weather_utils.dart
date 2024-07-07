String getWeatherBackground(String icon) {
  switch (icon) {
    case '01d':
    case '01n':
      return 'assets/clear_sky.jpg';
    case '02d':
    case '02n':
      return 'assets/few_clouds.jpg';
    case '03d':
    case '03n':
      return 'assets/scattered_clouds.jpg';
    case '04d':
    case '04n':
      return 'assets/broken_clouds.jpg';
    case '09d':
    case '09n':
      return 'assets/shower_rain.jpg';
    case '10d':
    case '10n':
      return 'assets/rain.jpg';
    case '11d':
    case '11n':
      return 'assets/thunderstorm.jpg';
    case '13d':
    case '13n':
      return 'assets/snow.jpg';
    case '50d':
    case '50n':
      return 'assets/mist.jpg';
    default:
      return 'assets/default.jpg';
  }
}
