import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 200),
                        child: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Verification',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        const Text(
                          '    Kami telah mengirimkan kode verifikasi ke\n    +628*******716 Ganti?',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          'Verification Code',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        'Re-send Code',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF3669C9),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 74,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Field";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 74,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Field";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 74,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Field";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 74,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Field";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: const [
                        Text(
                          'Kirim kode ulang dalam',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF838589)),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          '03:05',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF838589)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: Color(0xFF3669C9)),
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            Navigator.pushNamed(context, "/fordotPassword");
                          }
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
