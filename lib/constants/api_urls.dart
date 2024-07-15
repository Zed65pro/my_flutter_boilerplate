

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final String _baseUrl = dotenv.env['BASE_API_URL'] ?? '';
  static final String _weatherApi = dotenv.env['OPEN_WEATHER_API_BASE_URL'] ?? '';
  static final String _weatherApiKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';

  static String currentWeatherByName(String city) =>
      '$_weatherApi/weather?q=$city&appid=$_weatherApiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}