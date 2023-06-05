import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/controllers/user_controller.dart';
import 'package:project/views/Login/forget_password.dart';
import 'package:project/views/profile_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _currentPage = const LoginPage();
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
      body: _currentPage is LoginPage
          ? SafeArea(
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
                      SizedBox(
                        width: 160,
                        height: 160,
                        child: Column(
                          children: [Image.asset('assets/images/logo.png')],
                        ),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 20, height: 2),
                            maxLength: 30,
                            //cursorColor: const Color(0xFF009688),
                            cursorHeight: 50,
                            cursorWidth: 2,
                            decoration: const InputDecoration(
                                hintText: 'البريد الإلكتروني',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                border: OutlineInputBorder(
                                  //borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  fontSize: 15.0,
                                ),
                                counterText: '',
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 20,
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
                      Column(
                        children: [
                          InkWell(
                            child: Text(
                              "إستعادة كلمة المرور",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[700]),
                            ),
                            onTap: () {
                              setState(() {
                                _currentPage = ForgetPasswordPage(
                                  onBack: () {
                                    setState(() {
                                      _currentPage = const LoginPage();
                                    });
                                  },
                                );
                              });
                            },
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
                                backgroundColor: Colors.blue[700]),
                            onPressed: () {
                              setState(() {
                                if (_keyForm.currentState!.validate()) {
                                  try {
                                    UserController()
                                        .login(userProvider.login(
                                            emailController.text,
                                            passwordController.text))
                                        .then((value) {
                                      UserController()
                                          .informationUser(
                                        emailController.text,
                                      )
                                          .then((value) {
                                        // setState(() {
                                        Navigator.pushReplacementNamed(
                                            context, "/bottomnavigation");
                                        //_currentPage = MyHomePage();
                                        // });
                                        EasyLoading.dismiss();
                                        EasyLoading.showSuccess(
                                            "تم تسجيل الدخول بنجاح");
                                        // Navigator.pushReplacementNamed(
                                        //   context,
                                        //   "/bottomnavigation",
                                        // );
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
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.red),
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
                            style: TextStyle(
                                color: Color(0xFF9ba8b0), fontSize: 20),
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
                                backgroundColor: Colors.blue[700]),
                            onPressed: () {
                              setState(() {
                                _currentPage = ProfilePage(
                                  onBack: () {
                                    setState(() {
                                      _currentPage = const LoginPage();
                                    });
                                  },
                                );
                              });

                              //   Navigator.pushNamed(context, '/profilePage');
                            },
                            child: const Text(
                              'تسجيل حساب',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : _currentPage,
    );
  }
}
