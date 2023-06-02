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
                          'Selamat Datang di\nBUMDES',
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
                          '    Silahkan masukan data untuk login',
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Masukan Alamat Email/ No Telepon Anda',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an Email Address or Phone Number";
                        } else if (!EmailValidator.validate(value)) {
                          return "Please enter the Valid Email Address";
                        } else
                          return null;
                      },
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
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
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                    ],
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
                          setState(() {
                            if (_keyForm.currentState!.validate()) {
                              Navigator.pushNamed(context, "/product");
                            }
                          });
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/resetPassword");
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                    ],
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
