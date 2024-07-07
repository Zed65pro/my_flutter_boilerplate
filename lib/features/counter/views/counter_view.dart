import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/appbar.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: context.tr('counter')),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              _buildCounter(),
              const SizedBox(height: 15),
              _buildIncrementButton(context),
              const SizedBox(height: 15),
              _buildDecrementButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Consumer<CounterController>(
      builder: (context, counter, child) => Text(
        '${context.tr('counter')}: ${counter.count}',
      ),
    );
  }

  Widget _buildDecrementButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<CounterController>(context, listen: false).decrement();
      },
      child: Text(context.tr('decrement')),
    );
  }

  Widget _buildIncrementButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<CounterController>(context, listen: false).increment();
      },
      child: Text(context.tr('increment')),
    );
  }
}
