import 'package:boilerplate/features/weather/data/data_sources/remote_data_source.dart';
import 'package:boilerplate/features/weather/domain/repositories/weather_repository.dart';
import 'package:boilerplate/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
