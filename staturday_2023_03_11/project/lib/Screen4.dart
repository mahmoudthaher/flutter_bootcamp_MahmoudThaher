import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Project_Screen4 extends StatefulWidget {
  const Project_Screen4({super.key});

  @override
  State<Project_Screen4> createState() => _Project_Screen4State();
}

class _Project_Screen4State extends State<Project_Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Image(
                  image: AssetImage('images/amazon.png'),
                  width: 50,
                ),
                title: const Text(
                  'Amazon Ads',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Row(
                  children: [
                    const Text(
                      'Promoted',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                trailing: InkWell(
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'With more shooping queries and traffic on Amazon.eq, Ramdon is a great time to launch a',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
                color: Color(0xFFeef3f7),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('images/amazon_shopping.png'),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 7),
                          child: const Text(
                            'Give your brand a boost \nduring the month of R...',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 115),
                          child: SizedBox(
                            height: 40,
                            child: Card(
                              color: Color(0xFFeef3f7),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(40)),
                              child: TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  child: Text(
                                    'Learn more',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 11,
                                child: Icon(
                                  Icons.thumb_up_alt,
                                  size: 10,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 11,
                                child: Icon(
                                  Icons.heart_broken,
                                  size: 10,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 11,
                                child: Icon(
                                  Icons.waving_hand,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '88',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 130),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '1 comment ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Text(
                            '.',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '4 reposts ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
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
              Container(
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.grey[700],
                            ),
                            Text(
                              ' Like',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 38.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.grey[700],
                            ),
                            Text(
                              ' Comment',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 38.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.refresh_outlined,
                              color: Colors.grey[700],
                            ),
                            Text(
                              ' Repost',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 38.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.grey[700],
                            ),
                            Text(
                              ' Send',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
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
    );
  }
}
