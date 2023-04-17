import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_exam/models/user_model.dart';
import '../controllers/user_controller.dart';
import 'idprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var storage = userdata();
  bool obscureText = true;
  final _keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _keyForm,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "user name",
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !EmailValidator.validate(value)) {
                        return "Please enter an email address";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "example@john.com",
                        prefixIcon: Icon(Icons.email)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value == null || value.length < 2) {
                        return "Please enter an valid password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "*******",
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
                        prefixIcon: const Icon(Icons.password)),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _handleCreateAction();
                      },
                      child: const Text("Edit"),
                    ),
                  ),
                ])),
      ),
    );
  }

  _handleCreateAction() async {
    if (_keyForm.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;
      String username = usernameController.text;
      UserModel user = UserModel(
        id: 3,
        username: username,
        email: email,
        password: password,
      );
      EasyLoading.show(status: "Loading");
      UserController().update(user).then((value) {
        EasyLoading.dismiss();
        EasyLoading.showInfo("Done");
      }).catchError((ex) {
        EasyLoading.dismiss();
        EasyLoading.showError(ex.toString());
      });
    }
  }
}
