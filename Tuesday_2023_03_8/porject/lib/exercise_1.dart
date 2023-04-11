import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    Exercise_1(),
  );
}

class Exercise_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/test.png'),
                  ),
                  title: const Text(
                    'Maximilian Guth',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        'Just now.Cologne. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Icon(
                        Icons.sports_basketball,
                        size: 15,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey[700],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    child: Icon(
                      Icons.more_horiz_outlined,
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 210),
                  child: const Text(
                    'This looks awesome! 😍',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/post.png'),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 135),
                          child: const Text(
                            'Super awesome cheese toast!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text(
                            'Lorem ipsum dolor sit amet,consetetur sadipscing elitr,sed diam nonumy eirmod tempor invidunt ut |.',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 267.0),
                          child: const Text(
                            'GRANDCENTRIX.NET',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.0,
                ),
                SizedBox(
                  height: 1.0,
                  width: 390.0,
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.grey[700],
                        ),
                        label: Text(
                          ' Like',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mode_comment_outlined,
                          color: Colors.grey[700],
                        ),
                        label: Text(
                          ' Comment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.screen_share_outlined,
                          color: Colors.grey[700],
                        ),
                        label: Text(
                          ' Share',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0,
                  width: double.infinity,
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.thumb_up_sharp,
                          color: Colors.blue,
                        ),
                        label: Text(
                          'Chuck Norris',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: AssetImage('assets/images/test.png'),
                      ),
                      SizedBox(
                        width: 360.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                          child: ListTile(
                            title: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Comment ...',
                                hintStyle: TextStyle(
                                  color: Color(0xff9da0a7),
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            trailing: Wrap(
                              spacing: 5,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.face_retouching_natural,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.gif_box_outlined,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.description_sharp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
