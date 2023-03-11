import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Project_Screen2 extends StatefulWidget {
  const Project_Screen2({super.key});

  @override
  State<Project_Screen2> createState() => _Project_Screen2State();
}

class _Project_Screen2State extends State<Project_Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        color: Color.fromARGB(255, 26, 205, 205),
                        Icons.ios_share_rounded,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Text(
                    ' الطقس لأربعة عشر يومًا',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  'المقابلين -934م عن سطح البحر',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ),
              WeatherContainer(
                text_1: '12°',
                image_1: Image(image: AssetImage('images/moon_1.png')),
                text_2: '22°',
                image_2: Image(image: AssetImage('images/sun_1.png')),
                text_3: '03/11',
                text_4: 'السبت',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '14°',
                image_1: Image(image: AssetImage('images/moon_2.png')),
                text_2: '22°',
                image_2: Image(image: AssetImage('images/sun_1.png')),
                text_3: '03/12',
                text_4: 'الأحد',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '11°',
                image_1: Image(image: AssetImage('images/moon_3.png')),
                text_2: '20°',
                image_2: Image(image: AssetImage('images/sun_1.png')),
                text_3: '03/13',
                text_4: 'الأثنين',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '8°',
                image_1: Image(image: AssetImage('images/moon_4.png')),
                text_2: '14°',
                image_2: Image(image: AssetImage('images/sun_2.png')),
                text_3: '03/14',
                text_4: 'الثلاثاء',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '8°',
                image_1: Image(image: AssetImage('images/moon_1.png')),
                text_2: '11°',
                image_2: Image(image: AssetImage('images/sun_3.png')),
                text_3: '03/15',
                text_4: 'الأربعاء',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '10°',
                image_1: Image(image: AssetImage('images/moon_2.png')),
                text_2: '15°',
                image_2: Image(image: AssetImage('images/sun_4.png')),
                text_3: '03/16',
                text_4: 'الخميس',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '9°',
                image_1: Image(image: AssetImage('images/moon_6.png')),
                text_2: '18°',
                image_2: Image(image: AssetImage('images/sun_4.png')),
                text_3: '03/17',
                text_4: 'الجمعة',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '7°',
                image_1: Image(image: AssetImage('images/moon_7.png')),
                text_2: '12°',
                image_2: Image(image: AssetImage('images/sun_5.png')),
                text_3: '03/18',
                text_4: 'السبت',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 10,
              ),
              WeatherContainer(
                text_1: '7°',
                image_1: Image(image: AssetImage('images/moon_1.png')),
                text_2: '13°',
                image_2: Image(image: AssetImage('images/sun_6.png')),
                text_3: '03/19',
                text_4: 'الأحد',
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: Container(color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({
    Key? key,
    required this.text_1,
    required this.image_1,
    required this.text_2,
    required this.image_2,
    required this.text_3,
    required this.text_4,
  }) : super(key: key);

  final String text_1;
  final Image image_1;
  final String text_2;
  final Image image_2;
  final String text_3;
  final String text_4;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: Icon(
              color: Color.fromARGB(255, 26, 205, 205),
              Icons.keyboard_arrow_down,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 50,
          ),
          Text(text_1),
          SizedBox(
            width: 50,
          ),
          Image(
            image: image_1.image,
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 40,
          ),
          Text(text_2),
          SizedBox(
            width: 40,
          ),
          Image(
            image: image_2.image,
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  text_3,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Text(
                  text_4,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
