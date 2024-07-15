import 'package:fpdart/fpdart.dart';
import '../../../../error/failure.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
