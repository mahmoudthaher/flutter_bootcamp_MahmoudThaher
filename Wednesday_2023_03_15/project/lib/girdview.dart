import 'package:flutter/material.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map> users = List.generate(
      100, (index) => {"id": index + 1, "name": "Name ${index + 1}"}).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Grid View'),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
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
      drawer: Container(
        child: Drawer(
          backgroundColor: Colors.blue[600],
          child: ListView(
            children: [
              Container(
                child: DrawerHeader(
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                      ),
                      Text(
                        "Mahmoud Thaher",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('mahmoud@gmail.com')
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 7,
                    ),
                    DrawerContaniner(
                        routs: "/dashboard",
                        icon: Icon(Icons.settings),
                        name: 'Dashboard'),
                    DrawerContaniner(
                        routs: "/listView",
                        icon: Icon(Icons.settings),
                        name: 'ListView'),
                    DrawerContaniner(
                        routs: "/tabs",
                        icon: Icon(Icons.settings),
                        name: 'Tabs'),
                    DrawerContaniner(
                        routs: "/customTab",
                        icon: Icon(Icons.settings),
                        name: 'CustomTab'),
                    DrawerContaniner(
                        routs: "/bottomTab",
                        icon: Icon(Icons.settings),
                        name: 'BottomTab'),
                    DrawerContaniner(
                        routs: "/concats",
                        icon: Icon(Icons.settings),
                        name: 'Concats'),
                  ],
                ),
              )
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

class DrawerContaniner extends StatelessWidget {
  const DrawerContaniner(
      {super.key, required this.routs, required this.icon, required this.name});

  final String routs;
  final Icon icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, routs);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: icon,
              ),
              Expanded(
                flex: 2,
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
