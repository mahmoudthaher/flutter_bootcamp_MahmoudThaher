import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project/controllers/post_controller.dart';
import 'package:project/models/post.dart';

class FakeApiPage extends StatefulWidget {
  const FakeApiPage({super.key});

  @override
  State<FakeApiPage> createState() => _FakeApiPageState();
}

class _FakeApiPageState extends State<FakeApiPage> {
  List<Post> _posts = [];
  int? id;

  @override
  void initState() {
    super.initState();
    _getAllPosts();
  }

  _getAllPosts() async {
    PostController().getAll().then((result) {
      setState(() {
        _posts = result;
      });
    }).catchError((ex) {
      print(ex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: _posts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: _posts.length,
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(),
                    ),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Id id = Id(id: _posts[index].id);
                        Navigator.pushNamed(context, "/postDetils",
                            arguments: id);
                      },
                      child: ListTile(
                        title: Text(_posts[index].title),
                        subtitle: Text(_posts[index].body),
                      ),
                    )));
  }
}

class Id {
  int id;

  Id({required this.id});
}
