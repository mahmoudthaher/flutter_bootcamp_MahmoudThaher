import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Project_Screen1 extends StatefulWidget {
  const Project_Screen1({super.key});

  @override
  State<Project_Screen1> createState() => _Project_Screen1State();
}

class _Project_Screen1State extends State<Project_Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 215,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 260,
                    ),
                    Text(
                      'الإعدادات',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.settings,
                            color: Color.fromARGB(255, 26, 205, 205)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 267,
                    ),
                    Text(
                      'الاشتراك',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.attach_money,
                            color: Color.fromARGB(255, 26, 205, 205)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 249,
                    ),
                    Text(
                      'عن التطبيق',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Text(
                          'i',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 26, 205, 205),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 237,
                    ),
                    Text(
                      'بلغ عن مشكلة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Text(
                          '!',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 26, 205, 205),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 247,
                    ),
                    Text(
                      'قيم التطبيق',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.star,
                            color: Color.fromARGB(255, 26, 205, 205)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 242,
                    ),
                    Text(
                      'انشر التطبيق',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.ios_share_rounded,
                            color: Color.fromARGB(255, 26, 205, 205)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 265,
                    ),
                    Text(
                      'أعلن معنا',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 26, 205, 205),
                      radius: 17,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.speaker,
                            color: Color.fromARGB(255, 26, 205, 205)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
