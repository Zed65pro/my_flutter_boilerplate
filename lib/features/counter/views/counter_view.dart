import 'package:boilerplate/features/counter/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => CounterController(),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: const Text("Counter"),
          ),
          body: Center(
            child: Column(
              children: [
                const Center(
                  child: Text('Counter'),
                ),
                const SizedBox(height: 15),
                Consumer<CounterController>(
                  builder: (context, counter, child) => Text(
                    'Counter: ${counter.count}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterController>(context, listen: false).increment();
                    },
                    child: const Text('Increment')),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterController>(context, listen: false).decrement();
                    },
                    child: const Text('Decrement'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
