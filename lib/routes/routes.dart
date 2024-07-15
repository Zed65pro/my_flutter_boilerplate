import 'package:boilerplate/features/onboarding/views/onboarding_view.dart';
import 'package:boilerplate/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../error/error_route.dart';
import '../features/counter/controllers/counter_controller.dart';
import '../features/counter/views/counter_view.dart';
import '../features/example.form/views/form_view.dart';
import '../features/home/views/home_view.dart';
import '../features/weather/data/data_sources/remote_data_source.dart';
import '../features/weather/data/repositories/weather_repository_impl.dart';
import '../features/weather/domain/use_cases/get_current_weather.dart';
import '../features/weather/presentation/pages/weather_page.dart';
import '../services/api_client.dart';

Widget withProvider<T extends ChangeNotifier>(Widget page, T Function() createNotifier) {
  return ChangeNotifierProvider(
    create: (_) => createNotifier(),
    child: page,
  );
}


class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String counter = '/counter';
  static const String myForm = '/my-form';
  static const String onboarding = '/onboarding';
  static const String weather = '/weather';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case counter:
        return MaterialPageRoute(builder: (_) => withProvider(const CounterView(), () => CounterController()));
      case myForm:
        return MaterialPageRoute(builder: (_) => const MyFormView());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case weather:
        final apiClient = ApiClient();
        final remoteDataSource = WeatherRemoteDataSourceImpl(apiClient: apiClient);
        final repository = WeatherRepositoryImpl(weatherRemoteDataSource: remoteDataSource);
        final getCurrentWeatherUseCase = GetCurrentWeatherUseCase(repository);
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => WeatherBloc(getCurrentWeatherUseCase),
            child: const WeatherPage(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}
