import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Next Page")),
        body: Center(
          child: Text("${counterProvider.counter}"),
        ));
  }
}
