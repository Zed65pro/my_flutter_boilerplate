import 'dart:convert';

import 'package:boilerplate/constants/api_urls.dart';
import 'package:boilerplate/error/api_exception.dart';
import 'package:boilerplate/features/weather/data/data_sources/remote_data_source.dart';
import 'package:boilerplate/features/weather/data/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;
import 'package:boilerplate/error/failure.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceHttpImpl weatherRemoteDataSourceImpl;

  setUpAll(() async {
    await dotenv.load(fileName: ".env");

    // Provide dummy values
    provideDummy<Either<Failure, WeatherModel>>( Right(WeatherModel.fromJson(json.decode(readJson('helpers/dummy_data/dummy_weather_response.json')))));
    provideDummy<Failure>(const ServerFailure('dummy'));
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl = WeatherRemoteDataSourceHttpImpl(client: mockHttpClient);
  });

  const testCityName = 'New York';

  group('get current weather', () {
    test('should return weather model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(ApiUrls.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response(readJson('helpers/dummy_data/dummy_weather_response.json'), 200));

      //act
      final result = await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

      //assert
      expect(result, isA<WeatherModel>());
    });

    test('should throw a server exception when the response code is 404 or other', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(ApiUrls.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response('Not found', 404));

      //act
      final result = weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

      //assert
      expect(result, throwsA(isA<ApiException>()));
    });
  });
}
