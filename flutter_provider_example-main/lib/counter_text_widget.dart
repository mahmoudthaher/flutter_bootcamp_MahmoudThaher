import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';

class CounterTextWidget extends StatelessWidget {
  const CounterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Container(
      child: Text(
        '${counterProvider.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
