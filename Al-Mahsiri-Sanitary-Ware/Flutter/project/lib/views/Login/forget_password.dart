// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/controllers/api_helper.dart';
import 'package:project/models/user_model.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatefulWidget {
  final VoidCallback onBack;
  const ForgetPasswordPage({required this.onBack, super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  int checkphoneAndEmail = 0;
  int? id;
  final _keyForm = GlobalKey<FormState>();
  final RegExp jordanianPhoneNumberRegExp = RegExp(
    r'^(078|079|077)[0-9]{7}$',
    caseSensitive: false,
    multiLine: false,
  );
  bool validateJordanianPhoneNumber(String phoneNumber) {
    return jordanianPhoneNumberRegExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _keyForm,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 30, bottom: 30),
                child: Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        widget.onBack();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: const [
                    Text(
                      'استعادة كلمة المرور',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 130,
                  child: Row(
                    children: const [
                      Text(
                        'لإستعادة كلمة المرور يجب عليك كتابة المعلومات \nالتالية بطريقة صحيحة',
                        maxLines: 2,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: TextFormField(
                    controller: emailController,
                    maxLength: 30,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.emailAddress,
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                      counterText: '',
                    ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: TextFormField(
                    controller: phoneNumberController,
                    maxLength: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.phone,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'رقم الهاتف',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                      errorMaxLines: 2,
                      counterText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال رقم الهاتف";
                      } else if (!validateJordanianPhoneNumber(value)) {
                        return " الرجاء إدخال رقم الهاتف بطريقة صحيحة 07xxxxxxxx";
                      }
                      return null;
                    },
                  ),
                ),
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
                        backgroundColor: Colors.blue[700]),
                    onPressed: () async {
                      if (_keyForm.currentState!.validate()) {
                        await checkUserAndPhone(UserModel(
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text));
                        if (checkphoneAndEmail == 1) {
                          final provider =
                              Provider.of<UserProvider>(context, listen: false);
                          provider.forgetId = id!;
                          EasyLoading.dismiss();
                          EasyLoading.showSuccess("تم التحقق بنجاح");

                          Navigator.pushNamed(context, "/resetPasswordPage");
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('المعلومات غير صحيحة'),
                                actions: [
                                  TextButton(
                                    child: const Text('رجوع'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: const Text(
                      'ارسل',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future checkUserAndPhone(UserModel user) async {
    try {
      dynamic jsonObject = await ApiHelper().postRequest(
          "api/Users/checkUserAndPhone", user.toJsoncheckUserAndPhone());

      final count = jsonObject.isEmpty ? 0 : 1;
      if (count == 1) {
        int id2 = int.parse(jsonObject[0]["id"].toString());
        setState(() {
          id = id2;
          checkphoneAndEmail = count;
        });
      } else {
        checkphoneAndEmail = count;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
