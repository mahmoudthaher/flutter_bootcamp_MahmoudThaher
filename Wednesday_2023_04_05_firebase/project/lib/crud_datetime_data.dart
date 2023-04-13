import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/models/crud.dart';

class CRUD_Data extends StatefulWidget {
  const CRUD_Data({super.key});

  @override
  State<CRUD_Data> createState() => _CRUD_DataState();
}

class _CRUD_DataState extends State<CRUD_Data> {
  final collection = FirebaseFirestore.instance.collection("crud");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App"), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cruddatetime");
            },
            icon: Icon(Icons.add_circle_outline_sharp))
      ]),
      body: StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("There are some error happened"));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<CRUD> users =
              snapshot.data!.docs.map((e) => CRUD.fromQuery(e)).toList();

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].Name),
                subtitle: Text(users[index].Type),
                trailing: Wrap(
                  children: [
                    TextButton(
                      onPressed: () {
                        _handleUpdateUserAction(users[index]);
                      },
                      child: Text("Edit"),
                    ),
                    TextButton(
                      onPressed: () {
                        _handleDeleteUserAction(users[index].id!);
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  _handleDeleteUserAction(String id) {
    EasyLoading.show(status: "Loading");
    collection.doc(id).delete().then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("$id has been deleted!");
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }

  _handleUpdateUserAction(CRUD user) {
    EasyLoading.show(status: "Loading");
    user.Name = "Khalid";
    user.Type = "Amman";
    collection.doc(user.id!).set(user.toJson()).then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("${user.id!} has been Updated!");
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }
}
