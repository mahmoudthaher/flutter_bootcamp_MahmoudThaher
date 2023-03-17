import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'girdview.dart';

class Profile_Page extends StatefulWidget {
  Profile profile;
  Profile_Page(this.profile, {super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(child: widget.profile.avatar),
              Text('name: Name ${widget.profile.id}'),
              Text(
                'id: ${widget.profile.id}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
