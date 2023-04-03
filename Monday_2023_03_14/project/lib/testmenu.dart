import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class testmenu extends StatefulWidget {
  const testmenu({super.key});

  @override
  State<testmenu> createState() => _testmenuState();
}

class _testmenuState extends State<testmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('menu'),
      ),
      body: Container(),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue[600],
              height: 200,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Text('data'),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('gggg'),
            ),
            ListTile(
              title: Text('gggg'),
            ),
            ListTile(
              title: Text('gggg'),
            )
          ],
        ),
      ),
    );
  }
}
