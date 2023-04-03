import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Concats extends StatefulWidget {
  const Concats({super.key});

  @override
  State<Concats> createState() => _ConcatsState();
}

class _ConcatsState extends State<Concats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            child: Text("Contacts Page"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
