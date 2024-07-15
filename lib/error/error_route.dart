import 'package:flutter/material.dart';

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