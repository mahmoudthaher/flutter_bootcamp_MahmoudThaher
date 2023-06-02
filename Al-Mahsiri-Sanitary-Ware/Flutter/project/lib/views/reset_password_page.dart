import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/controllers/user_controller.dart';
import 'package:project/models/user_model.dart';

class RestPasswordPage extends StatefulWidget {
  final VoidCallback onBack;
  const RestPasswordPage({required this.onBack, super.key});

  @override
  State<RestPasswordPage> createState() => _RestPasswordPageState();
}

class _RestPasswordPageState extends State<RestPasswordPage> {
  final storage = FlutterSecureStorage();
  final _keyForm = GlobalKey<FormState>();
  bool obscureText = false;
  bool obscureText2 = false;
  bool obscureText3 = false;
  final currentpasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _keyForm,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () {
                        widget.onBack();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: passwordController,
                    //maxLength: 20,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    obscureText: !obscureText,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      hintText: 'كلمة المرور',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 15),
                      border: const OutlineInputBorder(
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
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      counterText: '',
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
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: repasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    obscureText: !obscureText2,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      hintText: 'إعادة كلمة المرور',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 15),
                      border: const OutlineInputBorder(
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
                            obscureText2 = !obscureText2;
                          });
                        },
                        child: obscureText2
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      counterText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إعادة إدخال كلمة المرور";
                      } else if (value != passwordController.text) {
                        return "كلمة المرور غير متطابقة";
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
                    onPressed: () {
                      setState(() {
                        if (_keyForm.currentState!.validate()) {
                          _resetPassword();
                        }
                      });
                    },
                    child: const Text(
                      'أرسل',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    try {
      String? id = await storage.read(key: 'id');
      String password = passwordController.text;
      UserController().resetPassword(UserModel(id: id, password: password));
      EasyLoading.dismiss();
      EasyLoading.showSuccess("تم نغير كلمة المرور بنجاح");
      widget.onBack();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
