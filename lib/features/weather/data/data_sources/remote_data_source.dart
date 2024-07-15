import 'dart:convert';
import 'package:boilerplate/constants/api_urls.dart';
import 'package:http/http.dart' as http;
import '../../../../error/api_exception.dart';
import '../../../../services/api_client.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response = await apiClient.get(ApiUrls.currentWeatherByName(cityName));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ApiException("An error occurred");
    }
  }
}


class WeatherRemoteDataSourceHttpImpl extends WeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSourceHttpImpl({required this.client});

  @override
  Future < WeatherModel > getCurrentWeather(String cityName) async {
    final response =
    await client.get(Uri.parse(ApiUrls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ApiException("Error occurred");
    }
  }
}
