import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});
  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  // CircleAvatar circleAvatar = const CircleAvatar(
  // child: FlutterLogo(),
  //);
  CircleAvatar circleAvatar = const CircleAvatar(
    backgroundColor: Colors.red,
  );
  final List<Map> users = List.generate(
      100, (index) => {"id": index + 1, "name": "Name ${index + 1}"}).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: GridView.builder(
        itemCount: users.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 1.0,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Profile profile = Profile(id: index + 1, avatar: circleAvatar);

            Navigator.pushNamed(context, "/profilepage", arguments: profile);
          },
          child: Column(
            children: [
              const CircleAvatar(backgroundColor: Colors.red),
              Text(
                users[index]["name"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile {
  int id;
  CircleAvatar avatar;

  Profile({required this.id, required this.avatar});
}
