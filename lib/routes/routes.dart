import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/counter/controllers/counter_controller.dart';
import '../features/counter/views/counter_view.dart';
import '../features/example.form/views/form_view.dart';
import '../features/home/views/home_view.dart';

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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case counter:
        return MaterialPageRoute(builder: (_) => withProvider(const CounterView(), () => CounterController()));
      case myForm:
        return MaterialPageRoute(builder: (_) => const MyFormView());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error),
            SizedBox(height: 16),
            Text('page not found.'),
          ],
        ),
      ),
    );
  }
}
