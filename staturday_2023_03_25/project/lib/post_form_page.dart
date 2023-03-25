import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:project/Check.dart';

import 'controllers/post_controller.dart';
import 'models/post.dart';

class PostFormPage extends StatefulWidget {
  Check check;

  PostFormPage(this.check, {super.key});

  @override
  State<PostFormPage> createState() => _PostFormPageState();
}

class _PostFormPageState extends State<PostFormPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  Post? post;
  @override
  void initState() {
    super.initState();
    _getPostDetails();
  }

  _getPostDetails() {
    EasyLoading.show(status: "Loading");
    PostController().getByID(widget.check.id).then((value) {
      EasyLoading.dismiss();
      setState(() {
        post = value;
      });
      _titleController.text = post!.title;
      _bodyController.text = post!.body;
      if (widget.check.checkdata == 1) {
        _titleController.text = "";
        _bodyController.text = "";
      }
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }

  _createPost() {
    PostController()
        .create(Post(
      userId: 0,
      id: 0,
      title: _titleController.text,
      body: _bodyController.text,
    ))
        .then((value) {
      EasyLoading.showSuccess("Created successfully");
    }).catchError((ex) {
      EasyLoading.showError(ex.toString());
    });
  }

  _PutPost() {
    EasyLoading.show(status: "Loading");
    PostController()
        .put(
            Post(
              userId: 0,
              id: 0,
              title: _titleController.text,
              body: _bodyController.text,
            ),
            widget.check.id)
        .then((value) {
      EasyLoading.showSuccess("Updated successfully");
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }

  _deletePost() {
    EasyLoading.show(status: "Loading");
    PostController().delete(widget.check.id).then((value) {
      EasyLoading.showSuccess("Deleted successfully");
      _titleController.text = "";
      _bodyController.text = "";
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _titleController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Title...."),
              ),
              TextFormField(
                controller: _bodyController,
                maxLines: 3,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Body...."),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      if (widget.check.checkdata == 1) {
                        _createPost();
                      } else if (widget.check.checkdata == 2) {
                        _PutPost();
                      } else if (widget.check.checkdata == 3) {
                        _deletePost();
                      }
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
