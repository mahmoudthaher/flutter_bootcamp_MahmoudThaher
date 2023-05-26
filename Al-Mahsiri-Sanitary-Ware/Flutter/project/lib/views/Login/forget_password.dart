import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/loginPage");
                      },
                      child: const Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.black,
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
                        'Reset Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '    Masukan Email/ No. Hp akun untuk mereset kata\n    sandi Anda ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                    ),
                  ],
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
                        'Email/ Phone',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: '0787006524',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an Phone";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
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
                          Navigator.pushNamed(context, "/verificationPage");
                        }
                      },
                      child: const Text(
                        'Reset',
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
        )),
      ),
    );
  }
}
