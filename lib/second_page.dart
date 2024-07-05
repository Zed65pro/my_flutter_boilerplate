import 'package:boilerplate/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("second page"),
        ),
        body: Center(
          child: Column(
            children: [
              const Center(
                child: Text('Second Page'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(NavigationService.context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('Route to first Page'))
            ],
          ),
        ),
      ),
    );
  }
}
