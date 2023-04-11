import 'package:flutter/material.dart';

import 'Model/Model.dart';

void main() {
  runApp(
    Exercise_2(),
  );
}

class Exercise_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF3b5999),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                const Text(
                  'facebook',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: const Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: ListTile(
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email or phone number',
                            hintStyle: TextStyle(
                              color: Color(0xff9da0a7),
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: const Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 7.0, left: 7.0, right: 7.0),
                      child: ListTile(
                        title: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Color(0xff9da0a7),
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {},
                    child: const Card(
                      color: Color(0xff4f69a2),
                      child: ListTile(
                        title: Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: InkWell(
                    child: const Text(
                      'Sign Up for Facebook',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: InkWell(
                    child: const Text(
                      'Need Help?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
