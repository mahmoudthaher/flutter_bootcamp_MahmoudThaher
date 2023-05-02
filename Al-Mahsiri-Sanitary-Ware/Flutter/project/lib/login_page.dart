import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  bool obscureText = true;
  final emailController = TextEditingController();

  bool enable = false;
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 33,
                            color: Color(0xFF1b0f0b),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/login_page/login.png'),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 20, height: 2),
                      //cursorColor: const Color(0xFF009688),
                      cursorHeight: 50,
                      cursorWidth: 2,
                      decoration: const InputDecoration(
                          hintText: 'البريد الإلكتروني',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          border: OutlineInputBorder(
                            //borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          errorStyle: TextStyle(
                            fontSize: 15.0,
                          ),
                          errorMaxLines: 2),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء إدخال البريد الإلكتروني";
                        } else if (!EmailValidator.validate(value)) {
                          return "الرجاء إدخال البريد الإلكتروني بطريقة صحيحة";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !obscureText,
                      style: const TextStyle(fontSize: 20, height: 2),
                      //cursorColor: const Color(0xFF009688),
                      cursorHeight: 50,
                      cursorWidth: 2,
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور',
                        hintStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 25, right: 30, top: 5, bottom: 5),
                        border: const OutlineInputBorder(
                          //borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        errorStyle: const TextStyle(
                          fontSize: 15.0,
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء إدخال كلمة المرور";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      child: const Text(
                        "إستعادة كلمة المرور",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF272727)),
                      ),
                      onTap: () {},
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          backgroundColor: Color(0xFF1b69a0)),
                      onPressed: () {
                        setState(() {
                          if (_keyForm.currentState!.validate()) {
                            //Navigator.pushNamed(context, "/product");
                          }
                        });
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF272727)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: const [
                    Text(
                      "غير مسجل حتى الآن؟",
                      style: TextStyle(color: Color(0xFF9ba8b0), fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          backgroundColor: Color(0xFF6fafc8)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/createupdateuser');
                      },
                      child: const Text(
                        'تسجيل حساب',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF272727)),
                      ),
                    ),
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
