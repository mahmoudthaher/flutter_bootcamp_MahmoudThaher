import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';
import 'package:provider_example/counter_text_widget.dart';
import 'package:provider_example/next_page.dart';
import 'package:provider_example/product_provider.dart';
import 'package:provider_example/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(        اذا كانت وحدة
    //       create: (context) => CounterProvider());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context,
        listen: false /*حتى ما يناديه كل مرة 1 2 3*/);
    //StatefulWidget مش مهم استخدم  providerطالما بستخدم

    print("${value++}");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const CounterTextWidget(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(),
                      ));
                },
                child: Text("Next Page"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.updateCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
