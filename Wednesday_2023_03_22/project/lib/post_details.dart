import 'package:flutter/material.dart';

import 'controllers/post_controller.dart';
import 'fake_api_page.dart';
import 'models/post.dart';
import 'models/comment.dart';

class PostDetails extends StatefulWidget {
  Id id;
  PostDetails(this.id, {super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List<Post> _posts = [];
  List<Comment> _comment = [];

  @override
  void initState() {
    super.initState();
    _getPostByID();
    _getCommentByID();
  }

  _getPostByID() {
    PostController().getByID(widget.id.id).then((result) {
      setState(() {
        _posts = result;
      });
    }).catchError((ex) {
      print(ex);
    });
  }

  _getCommentByID() {
    PostController().getCommentByID(widget.id.id).then((result) {
      setState(() {
        _comment = result;
      });
    }).catchError((ex) {
      print(ex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: _posts.isEmpty && _comment.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Text(
                      'Id',
                      style: TextStyle(fontSize: 25),
                    ),
                    title: Text(
                      '${_posts[0].id}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Title',
                      style: TextStyle(fontSize: 25),
                    ),
                    title: Text(
                      '${_posts[0].title}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Body',
                      style: TextStyle(fontSize: 25),
                    ),
                    title: Text(
                      '${_posts[0].body}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                    child: ListTile(
                      title: Text(''),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 470,
                    child: ListView.separated(
                        itemCount: _comment.length,
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(),
                            ),
                        itemBuilder: (context, index) => ListTile(
                              leading: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                              ),
                              title: Wrap(
                                children: [
                                  Text(
                                    'Name :  ${_comment[index].name}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    'Email :  ${_comment[index].email}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    'Body :  ${_comment[index].body}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  ),
                ],
              ),
            ),
    );
  }
}
