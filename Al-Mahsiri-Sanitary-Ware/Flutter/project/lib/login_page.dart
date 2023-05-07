import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/controllers/api_helper.dart';
import 'package:project/controllers/user_controller.dart';
import 'package:project/models/user_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  bool obscureText = false;
  final emailController = TextEditingController();
  bool enable = false;
  final passwordController = TextEditingController();
  final loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
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
                        errorMaxLines: 2,
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
                        } else if (value.length < 8) {
                          return "كلمة المرور يجب ان تكون مكونة من 8 خانات على الأقل";
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
                            try {
                              UserController()
                                  .login(userProvider.login(
                                      emailController.text,
                                      passwordController.text))
                                  .then((value) {
                                informationUser(userProvider.login(
                                        emailController.text,
                                        passwordController.text))
                                    .then((value) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/test",
                                  );
                                }).catchError((ex) {
                                  print(ex);
                                });
                              }).catchError((ex) {
                                loginController.text =
                                    "إسم المستخدم او كلمة المرور غير صحيحة";
                              });
                            } catch (ex) {
                              EasyLoading.dismiss();
                              EasyLoading.showError(ex.toString());
                            }
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
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                    controller: loginController,
                    readOnly: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        Navigator.pushNamed(context, '/profilePage');
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

  Future<void> informationUser(UserModel user) async {
    try {
      dynamic jsonObject = await ApiHelper()
          .postRequest("api/Users/informationUser", user.toJsonLogin());
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.user = UserModel.fromJson(jsonObject[0]);
    } catch (ex) {
      rethrow;
    }
  }
}
